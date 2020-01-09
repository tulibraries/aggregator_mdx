<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
    
    <pattern id="RequiredElementsPattern">
        <title>CSV fields required</title>
        <rule context="record">
            <assert test="Title" id="Required1" role="error">There must be a title</assert>
        </rule>
    </pattern>
    <pattern id="TitleElementPattern">
        <title>Required fields must contain text.</title>
        <rule context="record/Title">
            <assert test="normalize-space(.)" id="Title1" role="error">The title property must contain text</assert>
        </rule>
    </pattern>
    
</schema>