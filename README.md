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

#### Using XSLT in Combine
Combine has specific hang-ups when using XSLT that imports other XSLT documents. See: https://combine.readthedocs.io/en/master/configuration.html?highlight=xslt#local-includes

Basically, to load these XSLT documents into Combine, each document with an `xsl:include` requires a change in the file to either import a HTTP URL of the included files (like a raw document GitHub URL) or be changed in Combine to reference the auto-generated filepath for those included within Combine.

### Validations

To be written up.

### ES Mappers

To be written up.

## Local Development & Testing

Unit tests for the XSLT are written using [XSpec](https://github.com/xspec/xspec). This testing library requires both the Saxon processor & Java to be installed. See the [XSpec installation instructions](https://github.com/xspec/xspec/wiki/Installation-on-Mac-and-Linux#requirements) for more if you want to run locally; otherwise, follow these Docker local development and testing setup instructions:

```
$ git clone https://github.com/tulibraries/aggregator_mdx.git
$ cd aggregator_mdx
$ make test
  [build output]
  [test output]
```

These commands run any `*.xspec` files found within the `transforms` or `validations` directories.

To add local tests, current practice is to create a similarly-named xspec file in the same directory as the file you are testing, then writing a test to confirm each case per validation rule, XSL matched template, or XSL named template. See the tutorial folder in [XSpec](https://github.com/xspec/xspec) for more help. Coverage is not currently calculated, but will be added in a future devOps rotation.

## Deployment to Combine

CI/CD for this repository is handled by Travis.

For CI, travis runs `make up` (building the same test infrastructure used above locally), then `make test-travis`. This is a modified version of `make tests`, so that failed tests actually return a non-0 code (and thus make the Travis build fail). You can see these commands in the `.travis.yml` file.

For CD, travis is planned to run scripts that will connect over SSH to the deployed infrastructure running Combine Docker, then run a load (create or update) command for every `*.xsl` file found within the `transforms` directory and every `*.sch` file found within the `validations` directory. This is waiting for code and infrastructure work on the Combine Docker projects.
