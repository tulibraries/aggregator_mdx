# PA Digital DPLA Hub Metadata Transforms & Validations

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
$ docker-compose build
  [build output]
$ docker-compose run xspec /input/remediations/remediations.xspec
  Creating network "aggregator_mdx_default" with the default driver
  Saxon script not found, invoking JVM directly instead.

  Creating XSpec Directory at /input/remediations/xspec...

  Creating Test Stylesheet...

  Running Tests...
  Testing with SAXON HE 9.7.0.18
  Testing deduping elements
  ..When encountering parentheses
  4 phrases should remain (source, creator x2, publisher)
        FAILED
  These are the unique elements and values remaining

  Formatting Report...
  passed: 1 / pending: 0 / failed: 1 / total: 2
  Report available at /input/remediations/xspec/remediations-result.html
  Done.
```



## Deployment to Combine
