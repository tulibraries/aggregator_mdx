# aggregator_mdx
This repository contains metadata transformations, validations, Elasticsearch mappers, and sample data (fixtures) used by the PA Digital aggregator setup. The validations and transformations are Schematron and XSL; while the mappers are for use in the Elasticsearch instance behind Combine. All pieces here are used in the PA Digital Combine, albeit the validations and transformations are created to be platform-independent (within realm of XML technologies).

### Transforms

The XSLT (all version 2) is written in 3 levels:

- collection-specific XSLT (e.g. `transforms/temple_p16002coll25.xsl`): these are the files you actually run against the desired XML files. This imports the provider-specific XSLT (next).
- provider-specific XSLT (e.g. `transforms/temple.xsl`): this file is imported above and contains XML node templates that are reused across collections. If/when collections are consistent enough to use the same XSLT, this can be made into that (for example, `dplah.xsl` could easily be a single collection & provider-level transform, though it currently imports shared templates from `temple.xsl` for sake of reuse). These imports the remediation XSLT (next).
- remediation-specific XSLT (`tranforms/remediations/*.xsl`): these files have normalization & enhancements.
  - `remediations/dedupe.xsl` performs a deduplication of elements and values within a record.
  - `remediations/filter.xsl` is a list of identifiers that cause a record to be filtered out from the transform output.
  - `remediations/lookups.xsl` has lookup parameters used by the above templates to normalize string values against a variety of vocabularies, including DCMI Types, the DPLA-recommended Getty AAT subset, Lexvo Language look-ups, month abbreviations, etc. An example of using these lookup params is commented out in `temple.xsl` (see the template for `dc:language`).

To run one of the collection-specific XSLT, you need to have all 3 files in the same directory structure.

### Validations

To be written up.

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

To run XSLT against a XML document:
1. Both the XSLT document(s) & the XML document need to be in this repository, e.g., in the `aggregator_mdx` directory or subdirectories.
2. Run the following command to build a Saxon image with your local directories available to it, then to run the `fixtures/sample.xml` XML document against the `transforms/sample.xsl` XSLT & output the result to `sample-result.xml`:

```
$ make s=fixtures/sample.xml xsl=transforms/sample.xsl o=sample-result.xml saxon
```

All three arguments are required:
- `s`: the source XML document you want to transform;
- `xsl`: the XSLT document you want to apply to the XML;
- `o`: the output document where the resulting XML is written.

### Running Schematron

WIP. Requires a bit more work.

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
2. Within the `x:description` parent node, write a test scenario (`x:scenario`) to test each case per validation rule, XSL matched template, or XSL named template. You can nest `x:scenario` elements as makes sense for what your testing (e.g., for the schematron tests, you could add a top-level scenario per pattern, then a child scenario within each for both checking valid XML passes and invalid XML returns the expected errors).
3. Each XSpec test has sample XML ('fixtures') that is passed in and the result checked. This data is passed via `x:context` within each scenario. You can either put in the fixture XML directly in the `x:content` node in each `x:scenario`, or you can have `x:context` reference fixture files in `fixtures` via an `href` attribute and relative path to the file in the repository.

When ready to check your test suite locally, you can run the tests as described below.

### Running XSpec Unit Tests

To run just the XSLT Unit tests (e.g. every `.xspec` file within `tests/xslt/`):

```
$ make test-xslt
  [test filename]
  [build output]
  [test output]
  [repeat the above for the next test file]
```

To run just the Schematron Unit tests (e.g. every `.xspec` file within `tests/schematron/`):

```
$ make test-sch
  [test filename]
  [build output]
  [test output]
  [repeat the above for the next test file]
```

To run all Unit tests (e.g. every `.xspec` file within `tests/schematron/` and within `tests/xslt/`)):

```
$ make test
  [test filename]
  [build output]
  [test output]
  [repeat the above for the next test file]
```

All of the above generate test reports in the relevant test directory, e.g. `tests/schematron/xspec` or `tests/schematron/xspec`. These are HTML and XML versions of the output, which can be helpful to review if debugging a failing test (just open the directory in your web browser via a local filepath). These are always ignored by git, so never checked into GitHub.

## CI/CD

[CircleCI](https://circleci.com/gh/tulibraries/aggregator_mdx) manages running CI/CD for this application. It does the following, using the same Docker images we use locally:
- build the Docker image with the repository files from that commit copied over;
- run a version of `make test` with a command to fail if `Error running the test suite` or `Error compiling the test suite` appears in the test output.
- run a coverage check that for every `.sch` file in `validations/` and `.xsl` in `transforms/` has a test file `[same filename].xspec` in `tests/`. CI will fail if this coverage is less than 70%.

## Deployment

The transformation and validation tasks in Airflow pull the `master` branch of this repository; so deployment is via successful CI and merging of PRs into `master`.
