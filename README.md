# aggregator_mdx (Updated documentation in progress)
This repository contains metadata transformations, validations, and sample data (fixtures) used by PA Digital's aggregator setup Shoo Fly Pie. The validations and transformations are Schematron and XSL. All pieces here are used by Shoo Fly, though the validations and transformations are created to be platform-independent (within realm of XML technologies).

PA Digital's aggregation system includes these components:
- Shoo Fly Pie: Runs on Apache Airflow, the backend, task-management system that ingests, processes, and publishes metadata to our OAI-PMH server. XSLT and Schematron files described here are called using a variables file found in [funcake_dags](https://github.com/tulibraries/funcake_dags) and imported manually into Airflow.

- [Funnel Cake](funnelcake.padigital.org/): the frontend Blacklight site that displays metadata ingested from our OAI-PMH server. This is used to more easily perform quality assessment on aggregated metadata.

The same filename is used across different file types (e.g., `cdm_temple.xsl` is used to transform the sample file `cdm_temple.xml` and is tested using `cdm_temple.xspec`). Except where an institution has a local or unnamed repository, the first part of the filename indicates which repository it is used for and the next is the ID of the institution we use locally. For our use in Airflow, dag_ids maintained in [funcake_dags](https://github.com/tulibraries/funcake_dags) should match the institution code used in filenames and the lookup table in aggregator_mdx, minus the prepended repo code. For example, the corresponding dag_id for "cdm_temple.xsl" should be "temple". 

To run one of the institution- or repository-specific XSLT, you need to have all 3 files in the directory structure provided here.

This documentation and the infrastructure described here was originally written and created by Christina Harlow and later updated to reflect evolving practice and use.

### Transforms

The XSLT (all version 2) is written to process XML metadata harvested via OAI-PMH as well as XML or CSV that are unavailable via OAI-PMH but stored in PA Digital's private data repository.

Transformations are written at three levels:

- institution- or repository-specific XSLT (e.g., `transforms/cdm_temple.xsl`): these are the files you actually run against the desired XML files and generally include mappings to crosswalk metadata whose location or presentation varies depending on repository and institution. These include digital object and thumbnail preview URLs; IIIF URLs; data provider, intermediate provider, and collection names; locally generated identifiers; and any mapping that should override the base crosswalk (next).

- base crosswalk XSLT (e.g., `transforms/oai_base_crosswalk.xsl`): this file is imported above and contains XML node templates that are reused across collections (for example, mapping incoming dc:title to PA Digital's dcterms:title, dc:creator to dcterms:creator, etc.). The OAI-PMH base crosswalks delimit on semicolon for all but the following fields where semicolon is sometimes used as punctuation: description, title, publisher, extent, relation, and rights. There are also base crosswalks to process CSV or XML stored in PA Digital's private data repository (`csv_generic_semic.xsl`, which delimits on `;` and `csv_generic_pipe.xsl`, which delimits on `|`). Base crosswalks should not be modified unless a change is desired for all processed collections. If an override of the base crosswalk is required, it should be done in the institution- or repository-specific XSLT described above (see `dcterms:isPartOf` mapping in `cdm_temple.xsl` for an example of a crosswalk override; the `priority` attribute should be used to avoid ambiguous rule matching).  All base crosswalks import the remediation XSLT (next).

- remediation-specific XSLT (`tranforms/remediations/*.xsl`): these files have normalization & enhancements.
  - `remediations/lookups.xsl` has lookup parameters used by the above templates to normalize string values against a variety of vocabularies, including DCMI Types, the DPLA-recommended Getty AAT subset, Lexvo Language look-ups, month abbreviations, etc. It is often used in institution or repository crosswalks to generate data provider names by a base URL, collection names by setSpec values, institutions codes for use in our local identifiers, etc. An example of using these lookup params can be found in `samvera_shi.xsl` (see `identifier` and `dataProvider` templates).

### Validations

Our validation scripts are written in Schematron, which uses XPath to test for different elements and patterns within the metadata. These files are found in the `/validations` folder. Validation scripts run at two points in the aggregation workflow - the first is immediately after ingest of metadata, and the second runs after the transform tasks. Within these steps, two separate scripts run concurrently. One serves as a filter; any invalid records as defined by the script do not proceed to the next task. Along with a human-readable error note such as, “There must be a title,” invalid records are listed in a CSV that can easily be passed on to data providers for review and remediation. The other script serves as a reporting tool; 'invalid' records do continue on to the next task. This creates a list of records that match specified XPath selections for assessment purposes. For example, `validations/padigital_missing_thumbnailURL.sch` tests for records that lack thumbnail URLs, allowing us to provide CSV reports to data providers without preventing records from moving to the next task.

In order to pass validation, the test must resolve to TRUE. If it resolves to FALSE, it is invalid. The tests should check for what *should* be present, rather than what should not. In the example below, an object URL in edm:isShownAt must begin with 'http.' If it does not, the validation fails with the following response: 'edm:isShownAt must contain a URL.'

```
<pattern id="ItemURLElementPattern">
    <title>Additional Trackback URL Requirements</title>
        <rule context="oai_dc:dc/edm:isShownAt">
            <assert test="normalize-space(.)" id="ItemURL1" role="error">The trackback URL must contain text</assert>
            <assert test="starts-with(normalize-space(.),'http')" id="ItemURL2" role="error">edm:isShownAt must contain a URL</assert>
        </rule>
</pattern>
```

## Local Development & Testing

You can install and run the following commands locally without Docker & Docker-Compose; you'll need to follow the installation instructions for your system (installing a Saxon processer; Java; and [XSpec](https://github.com/xspec/xspec/wiki/Installation-on-Mac-and-Linux#requirements). We recommend installing [Docker](https://docs.docker.com/v17.09/engine/installation/) & [Docker-Compose](https://docs.docker.com/compose/install/) however, and our `make` commands only work in the Docker context.

Before running any of the below `make` commands, you'll want to make sure Docker is running on your system and `docker-compose` is in your local PATH. To verify this, you can run the following:

```
$ docker -v
Docker version 19.03.4, build 9013bf583a
$ docker-compose -v
docker-compose version 1.24.0, build 0aa59064
```
You just want both commands to return a version; the version and build numbers may vary from above, and that's okay.

Additionally, you'll need this repository, `aggregator_mdx`, available locally, and you need to be in the top level of this repository. If you do not have this repository locally, you can run:

```
$ git clone https://github.com/tulibraries/aggregator_mdx.git
$ cd aggregator_mdx
```

### Running XSLT

To run XSLT against an XML document:
1. Both the XSLT document(s) & the XML document need to be in this repository, e.g., in the `aggregator_mdx` directory or subdirectories.
2. Run the following command to build a Saxon image with your local directories available to it, then to run the `fixtures/sample.xml` XML document against the `transforms/sample.xsl` XSLT & output the result to `sample-result.xml`:

```
$ make s=fixtures/sample.xml xsl=transforms/sample.xsl o=sample-result.xml saxon
```

All three arguments are required:
- `s`: the source XML document you want to transform;
- `xsl`: the XSLT document you want to apply to the XML;
- `o`: the output document where the resulting XML is written.


### Writing XSpec Unit Tests

Unit tests for the XSLT and Schematron documents are written using [XSpec](https://github.com/xspec/xspec). See their GitHub wiki for further examples and details on how to write and use these tests (for example, the XSpec tutorial folder in [XSpec](https://github.com/xspec/xspec)).

To add tests:
1. Create an xspec file within `tests` directory, putting XSLT test files in `tests/xslt/`, and Schematron test files in `tests/schematron/`. The test file should be the same exact name of the XSLT or Schematron file you're testing (e.g., `tests/schematron/padigital_reqd_fields.xspec` contains the tests for `validations/padigital_reqd_fields.sch`).
2. Add the `x:description` root element, adding namespaces you'll be using in sample data & either a `schematron` or a `stylesheet` pointing to the .sch or .xsl file you're testing, e.g.:
  ```
  <?xml version="1.0" encoding="UTF-8"?>
  <x:description xmlns:x="http://www.jenitennison.com/xslt/xspec"
  schematron="../../validations/padigital_reqd_fields.sch">
  </x:description>
  ```
  or
  ```
  <x:description xmlns:x="http://www.jenitennison.com/xslt/xspec"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dpla="http://dp.la/about/map/"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
    xmlns:oclcterms="http://purl.org/oclc/terms/"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/'
    xmlns:oclc="http://purl.org/oclc/terms/"
    xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
    xmlns:schema="http://schema.org"
    xmlns:svcs="http://rdfs.org/sioc/services"
    stylesheet="../../transforms/dplah.xsl">
  </x:description>
  ```
2. Within the `x:description` parent node, write a test scenario (`x:scenario`) to test each case per validation rule, XSL matched template, or XSL named template. You can nest `x:scenario` elements as makes sense for what you are testing (e.g., for the schematron tests, you could add a top-level scenario per pattern, then a child scenario within each for both checking valid XML passes and invalid XML returns the expected errors).
3. Each XSpec test has sample XML ('fixtures') that is passed in and the result checked. This data is passed via `x:context` within each scenario. You can either put in the fixture XML directly in the `x:content` node in each `x:scenario`, or you can have `x:context` reference fixture files in `fixtures` via an `href` attribute and relative path to the file in the repository.

When ready to check your test suite locally, you can run the tests as described below.

### Running XSpec Unit Tests

To run just the XSLT Unit tests (e.g. every `.xspec` file within `tests/xslt/`):

```
$ make test-xslt
```

To run just the Schematron Unit tests (e.g. every `.xspec` file within `tests/schematron/`):

```
$ make test-sch
```

To run all Unit tests (e.g. every `.xspec` file within `tests/schematron/` and within `tests/xslt/`):

```
$ make test
```

All of the above generate test reports in the relevant test directory, e.g. `tests/schematron/xspec` or `tests/schematron/xspec`. These are HTML and XML versions of the output, which can be helpful to review if debugging a failing test (just open the directory in your web browser via a local filepath). These are always ignored by git, so never checked into GitHub.

Alternatively, you can run individual unit tests from within Oxygen. See documentation [here](https://www.oxygenxml.com/doc/versions/23.1/ug-editor/topics/xspec-helper-view-addon.html). Please note that this only tests a single XSpec file. It is handy to troubleshoot and check tests quickly, but since transforms are often run against multiple sample files, the integrity of the repository depends on *all* tests running sucessfully. The Docker commands described above test all of the XSpecs in a folder, and is far more reliable.

## CI/CD

[CircleCI](https://circleci.com/gh/tulibraries/aggregator_mdx) manages running CI/CD for this application. It does the following, using the same Docker images we use locally:
- build the Docker image with the repository files from that commit copied over;
- run a version of `make test` with a command to fail if `Error running the test suite` or `Error compiling the test suite` appears in the test output.
- run a coverage check that for every `.sch` file in `validations/` and `.xsl` in `transforms/` has a test file `[same filename].xspec` in `tests/`. CI will fail if this coverage is less than 70%.

## Deployment

The transformation and validation tasks in Airflow pull the `main` branch of this repository; so deployment is via successful CI and merging of PRs into `main`.
