<?xml version="1.0" encoding="UTF-8"?>
<!-- Funnelcake name: Lookup -->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:dpla="http://dp.la/about/map/"
    xmlns:padig="http://padigital.org/ns"
    xmlns:edm="http://www.europeana.eu/schemas/edm/"
    xmlns:oclcdc="http://worldcat.org/xmlschemas/oclcdc-1.0/"
    xmlns:oclcterms="http://purl.org/oclc/terms/"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc='http://www.openarchives.org/OAI/2.0/oai_dc/'
    xmlns:oclc="http://purl.org/oclc/terms/"
    xmlns:oai_qdc="http://worldcat.org/xmlschemas/qdc-1.0/"
    xmlns:schema="http://schema.org"
    xmlns:svcs="http://rdfs.org/sioc/services" version="2.0">

    <xsl:include href="lookup_aps.xsl"/>
    <xsl:include href="lookup_power.xsl"/>

    <!-- lookup table for IANA media types -->
    <xsl:param name="fFormatList">
        <padig:fformat string="image/jpeg">jpg</padig:fformat>
        <padig:fformat string="image/jpeg">jpeg</padig:fformat>
        <padig:fformat string="image/jp2">jp2</padig:fformat>
        <padig:fformat string="image/jp2">jpg2</padig:fformat>
        <padig:fformat string="image/jp2">jpeg2</padig:fformat>
        <padig:fformat string="image/jp2">jpeg2000</padig:fformat>
        <padig:fformat string="image/jp2">jp2000</padig:fformat>
        <padig:fformat string="image/tiff">tif</padig:fformat>
        <padig:fformat string="image/tiff">tiff</padig:fformat>
        <padig:fformat string="application/pdf">pdf</padig:fformat>
        <padig:fformat string="video/mpeg">mpeg4</padig:fformat>
        <padig:fformat string="video/mp4">mp4</padig:fformat>
        <padig:fformat string="video/mpeg">mpeg</padig:fformat>
        <padig:fformat string="audio/mpeg">mpeg3</padig:fformat>
        <padig:fformat string="audio/mp3">mp3</padig:fformat>
    </xsl:param>

    <!-- lookup table for Contributing Institutions/OAI base URLs -->
    <xsl:param name="oaiUrl">
        <padig:url string="American Philosophical Society" code="APS">https://diglib.amphilsoc.org/</padig:url>
        <padig:url string="Cabrini University" code="CABRINI">http://cdm17305.contentdm.oclc.org/</padig:url>
        <padig:url string="Catholic Historical Research Center of the Archdiocese of Philadelphia" code="CHRC">https://omeka.chrc-phila.org/</padig:url>
        <padig:url string="Curtis Institute of Music" code="CURTIS">http://cdm16667.contentdm.oclc.org/</padig:url>
        <padig:url string="Documenting Pitt" code="DOCPITT">https://documenting.pitt.edu/</padig:url>
        <padig:url string="Documenting Pitt" code="DOCPITT">http://documenting.pitt.edu/</padig:url>
        <padig:url string="Franklin and Marshall College" code="FANDM">https://digital.fandm.edu/</padig:url>
        <padig:url string="Historical Medical Library of The College of Physicians of Philadelphia" code="CPP">http://www.cppdigitallibrary.org/</padig:url>
        <padig:url string="Historical Medical Library of The College of Physicians of Philadelphia" code="CPP">https://www.cppdigitallibrary.org/</padig:url>
        <padig:url string="Historical Medical Library of The College of Physicians of Philadelphia" code="CPP">https://cppdigitallibrary.org/</padig:url>
        <padig:url string="Historical Medical Library of The College of Physicians of Philadelphia" code="CPP">http://cppdigitallibrary.org/</padig:url>
        <padig:url string="La Salle University" code="LASALLE">http://cdm15860.contentdm.oclc.org/</padig:url>
        <padig:url string="La Salle University" code="LASALLE">http://digitalcommons.lasalle.edu/</padig:url>
        <padig:url string="La Salle University" code="LASALLE">https://digitalcommons.lasalle.edu/</padig:url>
        <padig:url string="Lafayette College" code="LAFAYETTE">https://ldr.lafayette.edu/</padig:url>
        <padig:url string="Lafayette College" code="LAFAYETTE">http://hdl.handle.net/10385/</padig:url>
        <padig:url string="Lehigh University" code="LEHIGH">http://cdm.lib.lehigh.edu/</padig:url>
        <padig:url string="The Library Company of Philadelphia" code="LIBCO">https://digital.librarycompany.org/</padig:url>
        <padig:url string="Media Historic Archives Commission" code="MHAC">https://www.mediahistoricarchives.org/</padig:url>
        <padig:url string="Moravian Historical Society" code="MORAVIAN">https://moravianhistoricalsociety.reclaim.hosting/oai</padig:url>
        <padig:url string="Pennsylvania State University" code="PENNSTATE">http://digital.libraries.psu.edu/</padig:url>
        <padig:url string="Philadelphia College of Osteopathic Medicine" code="PCOM">http://digitalcommons.pcom.edu/</padig:url>
        <padig:url string="Philadelphia College of Osteopathic Medicine" code="PCOM">https://digitalcommons.pcom.edu/</padig:url>
        <padig:url string="Presbyterian Historical Society" code="PHS">https://digital.history.pcusa.org/</padig:url>
        <padig:url string="Science History Institute" code="SHI">https://digital.sciencehistory.org/</padig:url>
        <padig:url string="State Library of Pennsylvania" code="SLP">https://digitalcollections.statelibrary.pa.gov/</padig:url>
        <padig:url string="Susquehanna University" code="SUSQU">http://pahistoryharvest.com/</padig:url>
        <padig:url string="Temple University" code="TEMPLE">http://digital.library.temple.edu/</padig:url>
        <padig:url string="University of Pennsylvania" code="PENN">http://digital.library.upenn.edu/</padig:url>
        <padig:url string="Villanova University" code="VILLANOVA">https://digital.library.villanova.edu/</padig:url>
        <padig:url string="Thomas Jefferson University" code="TJU">http://jdc.jefferson.edu/</padig:url>
        <padig:url string="Thomas Jefferson University" code="TJU">https://jdc.jefferson.edu/</padig:url>
        <padig:url string="Thomas Jefferson University - East Falls" code="JEF">http://digitalcollections.philau.edu/</padig:url>
        <padig:url string="University of Pennsylvania" code="PENN">http://dla.library.upenn.edu/dla/</padig:url>
        <padig:url string="University of Pittsburgh" code="PITT">https://digital.library.pitt.edu/</padig:url>
        <padig:url string="University of Pittsburgh" code="PITT">http://digital.library.pitt.edu/</padig:url>
        <padig:url string="University of Scranton" code="USCRANTON">http://digitalservices.scranton.edu/</padig:url>
        <padig:url string="Ursinus College" code="URSINUS">http://digitalcommons.ursinus.edu/</padig:url>
        <padig:url string="Ursinus College" code="URSINUS">https://digitalcommons.ursinus.edu/</padig:url>
        <padig:url string="Widener University" code="WIDEN">http://digitalwolfgram.widener.edu/</padig:url>
    </xsl:param>

    <!-- lookup table for Intermediate Providers/OAI base URLs -->
    <xsl:param name="oaiUrlInt">
        <padig:url string="Keystone Library Network" code="KLN">http://cdm17189.contentdm.oclc.org/</padig:url>
        <padig:url string="Keystone Library Network" code="KLN">http://digital.klnpa.org/</padig:url>
        <padig:url string="Lackawanna Valley Digital Archives" code="LVDA">http://content.lackawannadigitalarchives.org/</padig:url>
        <padig:url string="POWER Library as sponsor and HSLC as maintainer" code="POWER">http://digitalcollections.powerlibrary.org/</padig:url>
        <padig:url string="POWER Library as sponsor and HSLC as maintainer" code="POWER">https://digitalarchives.powerlibrary.org/papd/</padig:url>
        <padig:url string="POWER Library as sponsor and HSLC as maintainer" code="POWER">https://digitalarchives.powerlibrary.org/psa/</padig:url>
        <padig:url string="Historic Pittsburgh" code="HP">http://historicpittsburgh.org/</padig:url>
        <padig:url string="Historic Pittsburgh" code="HP">https://historicpittsburgh.org/</padig:url>
        <padig:url string="Philadelphia Architects and Buildings" code="PAB">https://www.philadelphiabuildings.org/pab/</padig:url>
    </xsl:param>

    <!-- lookup table for Contributing Institutions with Intermediate Providers by setSpec -->
    <xsl:param name="ContInt">
        <padig:cont string="Bloomsburg University" code="BLOOMS">blmmap</padig:cont>
        <padig:cont string="Bloomsburg University" code="BLOOMS">blmphoto</padig:cont>
        <padig:cont string="Bloomsburg University" code="BLOOMS">blmpost</padig:cont>
        <padig:cont string="Bloomsburg University" code="BLOOMS">blmwwi</padig:cont>
        <padig:cont string="Bloomsburg University" code="BLOOMS">CHSminutes</padig:cont>
        <padig:cont string="Slippery Rock University" code="SRU">audio</padig:cont>
        <padig:cont string="Slippery Rock University" code="SRU">photograph</padig:cont>
        <padig:cont string="Slippery Rock University" code="SRU">postcard</padig:cont>
        <padig:cont string="Slippery Rock University" code="SRU">yearbooks</padig:cont>
        <padig:cont string="Slippery Rock University" code="SRU">p17189coll5</padig:cont>
        <padig:cont string="Slippery Rock University" code="SRU">alternator</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">wcudoll</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">diaries</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">qwcaralia</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">qwcarch</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">wcutreasure</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">chester</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">qwccivilwar</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">p17189coll4</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">philips</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">qwcphoto</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">qwcpost</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">redware</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">sharples</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">wcnp01</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">p17189coll1</padig:cont>
        <padig:cont string="West Chester University" code="WESTCH">wpa</padig:cont>
        <padig:cont string="Millersville University" code="WESTCH">mvsphoto</padig:cont>
        <padig:cont string="Millersville University" code="WESTCH">wingpost</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">almaclarke</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">BMC_collnew</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">BMC_photoarc</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">BMC_postcard</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">BMC_scrpbks</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">BMC_yrbks</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">castle</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">BMC_AdvertisingCards</padig:cont>
        <padig:cont string="Bryn Mawr College" code="BRYNMAWR">Mellink</padig:cont>
        <padig:cont string="Friends Historical Library of Swarthmore College" code="SWATHAVERFORD">SC_Truman</padig:cont>
        <padig:cont string="Haverford College Quaker and Special Collections and Friends Historical Library of Swarthmore College" code="SWATHAVERFORD">SC_Broad</padig:cont>
    </xsl:param>

    <!-- lookup table for collection name by setSpec -->
    <xsl:param name="setSpecList">

        <!-- APS -->
        <padig:set string="Eastern State Penitentiary">text_Mss.365.P381p</padig:set>
        <padig:set string="Henry Howard Houston III">graphics_Mss.Ms.Coll.76.17</padig:set>
        <padig:set string="Thomas Paine Political Cartoons">graphics_Mss.B.P165</padig:set>
        <padig:set string="Titian Ramsay Peale Sketches">graphics_Mss.B.P.31.15d</padig:set>
        <padig:set string="William Parker Foulke">text_Mss.B.F826</padig:set>
        <padig:set string="Graphics Collection">islandora_graphics_collection</padig:set>

        <!-- Bloomsburg -->
        <padig:set string="Bloomsburg University Map Collection">blmmap</padig:set>
        <padig:set string="Bloomsburg University Photographs Collection">blmphoto</padig:set>
        <padig:set string="Bloomsburg University Postcard Collection">blmpost</padig:set>
        <padig:set string="Bloomsburg University Town Council Minutes Collection">CHSminutes</padig:set>
        <padig:set string="Bloomsburg University World War I Student Files Collection">blmwwi</padig:set>

        <!-- Bryn Mawr -->
        <padig:set string="Bryn Mawr College Photographs">BMC_photoarc</padig:set>
        <padig:set string="Machteld J. Mellink Collection of Archaeological Site Photography">Mellink</padig:set>
        <padig:set string="Bryn Mawr College News">BMC_collnew</padig:set>
        <padig:set string="Castle Collection of Natural History Illustrations">castle</padig:set>
        <padig:set string="Early Advertising Collection">BMC_AdvertisingCards</padig:set>
        <padig:set string="Bryn Mawr College Postcards">BMC_postcard</padig:set>
        <padig:set string="Bryn Mawr College Yearbooks">BMC_yrbks</padig:set>
        <padig:set string="Bryn Mawr College Scrapbook and Photo Album Collection">BMC_scrpbks</padig:set>
        <padig:set string="Alma A. Clarke Papers">almaclarke</padig:set>

        <!-- Cabrini CDM-->
        <padig:set string="America's First Citizen Saint - The Saint Frances Cabrini Collection">p17305coll22</padig:set>
        <padig:set string="Personal Effects">p17305coll1</padig:set>
        <padig:set string="Relics">p17305coll2</padig:set>
        <padig:set string="Travels">p17305coll5</padig:set>
        <padig:set string="Popes and Prelates">p17305coll6</padig:set>
        <padig:set string="Beatification and Canonization Documents">p17305coll7</padig:set>
        <padig:set string="Beatification and Canonization Photographs">p17305coll8</padig:set>
        <padig:set string="Beatification and Canonization Subjects of Miracles">p17305coll9</padig:set>
        <padig:set string="Mother Cabrini Letters">p17305coll10</padig:set>
        <padig:set string="Photographs">p17305coll11</padig:set>
        <padig:set string="International Missions">p17305coll3</padig:set>
        <padig:set string="New Orleans Louisiana Missions">p17305coll13</padig:set>
        <padig:set string="Memorie">p17305coll15</padig:set>
        <padig:set string="Saint Frances Cabrini Documents">p17305coll16</padig:set>
        <padig:set string="Saint Frances Cabrini Commemorative Items">p17305coll17</padig:set>
        <padig:set string="Sisters of Providence">p17305coll26</padig:set>

        <!-- Curtis -->
        <padig:set string="de Pasquale collection">myfirst</padig:set>
        <padig:set string="Curtis program books">p16667coll1</padig:set>
        <padig:set string="Archives- Image Collection">p16667coll3</padig:set>
        <padig:set string="Collection of Samuel Barber Materials">p16667coll4</padig:set>
        <padig:set string="Eleanor Lipkin Papers">p16667coll5</padig:set>

        <!-- Documenting Pitt -->
        <padig:set string="Pitt Administration">pitt_collection.159</padig:set>
        <padig:set string="Pitt Alumni">pitt_collection.2</padig:set>
        <padig:set string="Pitt Athletics">pitt_collection.4</padig:set>
        <padig:set string="Pitt Campus Life">pitt_collection.160</padig:set>
        <padig:set string="Pitt Faculty">pitt_collection.5</padig:set>
        <padig:set string="Pitt Nationality Rooms">pitt_collection.6</padig:set>
        <padig:set string="Pitt News">pitt_collection.9</padig:set>
        <padig:set string="Pitt Photographs">pitt_collection.7</padig:set>
        <padig:set string="Pitt Publications">pitt_collection.3</padig:set>
        <padig:set string="Pitt Student Life">pitt_collection.8</padig:set>
        <padig:set string="Pitt Yearbooks">pitt_collection.12</padig:set>
        <padig:set string="University Catalogues">pitt_collection.326</padig:set>
        <padig:set string="University of Pittsburgh Bradford">pitt_collection.330</padig:set>
        <padig:set string="University of Pittsburgh Greensburg">pitt_collection.14</padig:set>
        <padig:set string="University of Pittsburgh Johnstown">pitt_collection.192</padig:set>
        <padig:set string="University Times">pitt_collection.325</padig:set>

        <!-- Franklin and Marshall -->
        <padig:set string="Alumni Magazine Collection">scholars-square_hist--alumni-mag-collection</padig:set>
        <padig:set string="Archives Film Collection">scholars-square_hist--film</padig:set>
        <padig:set string="F&amp;M Founding Documents Collection">scholars-square_hist--founding-docs</padig:set>
        <padig:set string="College and Academy Photograph Albums Collection">scholars-square_hist--photo-albums</padig:set>
        <padig:set string="College Photographs Collection">scholars-square_hist--photos</padig:set>
        <padig:set string="Student Newspapers Collection">scholars-square_hist--newspapers</padig:set>
        <padig:set string="College Yearbooks Collection">scholars-square_hist--yearbooks</padig:set>
        <padig:set string="World War I Diaries Collection">scholars-square_hist--wwi</padig:set>
        <padig:set string="Lancaster Atlases and Pictorial Works Collection">scholars-square_sc--atlases</padig:set>
        <padig:set string="Bill Hutson Slides Collection">scholars-square_sc--hutson</padig:set>
        <padig:set string="Lancaster Journal">scholars-square_sc--lancaster--journal--collection</padig:set>
        <padig:set string="Muench Family Papers Collection">scholars-square_sc--muench</padig:set>
        <padig:set string="Pennsylvania Dutchman (Periodical) Collection">scholars-square_sc--pa-dutchman-collection</padig:set>
        <padig:set string="Pennsylvania German Broadside Collection">scholars-square_sc--pa-german-broadside</padig:set>
        <padig:set string="Pennsylvania German Fraktur Collection">scholars-square_sc--pa-german-fraktur</padig:set>
        <padig:set string="Reynolds Family Papers Collection">scholars-square_sc--reynolds</padig:set>
        <padig:set string="Wohlsen Construction Company Marketing and Advertising Collection">scholars-square_sc--wohlsen-marketing</padig:set>
        <padig:set string="Wohlsen Construction Company Photograph Collection">scholars-square_sc--wohlsen-photos</padig:set>

        <!-- Historic Pittsburgh -->
        <padig:set string="Aaronel deRoy Gruber Papers and Photographs">pitt_collection.440</padig:set>
        <padig:set string="Adolph M. Foerster Collection">pitt_collection.168</padig:set>
        <padig:set string="Aerial Photographs of Pittsburgh">pitt_collection.33</padig:set>
        <padig:set string="African American Jazz Preservation Society of Pittsburgh Oral History Project Records and Recordings">pitt_collection.212</padig:set>
        <padig:set string="African American Construction Workers of Pittsburgh Photographs">pitt_collection.176</padig:set>
        <padig:set string="Alexander Addison Papers">pitt_collection.15</padig:set>
        <padig:set string="Alexander Cumming Papers">pitt_collection.249</padig:set>
        <padig:set string="Alexander Lowy Papers">pitt_collection.13</padig:set>
        <padig:set string="Allegheny Conference on Community Development Photographs">pitt_collection.34</padig:set>
        <padig:set string="Allegheny County Photography Department Photographs">pitt_collection.320</padig:set>
        <padig:set string="Allegheny Observatory Records">pitt_collection.108</padig:set>
        <padig:set string="Aluminum Company of America Photographs">pitt_collection.274</padig:set>
        <padig:set string="American Left Ephemera Collection">pitt_collection.107</padig:set>
        <padig:set string="Andrew Carnegie Correspondence Collection">pitt_collection.349</padig:set>
        <padig:set string="Archives of Industrial Society Photograph Collection">pitt_collection.226</padig:set>
        <padig:set string="Beazel Family Papers">pitt_collection.246</padig:set>
        <padig:set string="Bedford County Township Tax Receipts">pitt_collection.16</padig:set>
        <padig:set string="Bill Green Photographs">pitt_collection.328</padig:set>
        <padig:set string="Birmingham United Church of Christ Records">pitt_collection.187</padig:set>
        <padig:set string="Blind and Vision Rehabilitation Services of Pittsburgh">pitt_collection.308</padig:set>
        <padig:set string="Bob Nelkin Collection of ACC-PARC Records">pitt_collection.341</padig:set>
        <padig:set string="Breathe Pennsylvania Records">pitt_collection.309</padig:set>
        <padig:set string="Bruce Drisbach-American Steel &amp; Wire Company Photographs">pitt_collection.35</padig:set>
        <padig:set string="Bryce Brothers and Lenox Incorporated Glass Records">pitt_collection.285</padig:set>
        <padig:set string="Bureau of Building Inspection, Department of Public Safety, Pittsburgh, Pa. Records">pitt_collection.186</padig:set>
        <padig:set string="CONSOL Energy, Inc. Mine Maps and Records">pitt_collection.32</padig:set>
        <padig:set string="Camp Johnson Photographs">pitt_collection.311</padig:set>
        <padig:set string="Carl T. Schofer Diaries">pitt_collection.380</padig:set>
        <padig:set string="Carnegie Library of Pittsburgh 125th Anniversary Collection">pitt_collection.363</padig:set>
        <padig:set string="Carnegie Museum of Art Collection of Photographs">pitt_collection.36</padig:set>
        <padig:set string="Carnegie Museum of Natural History Archives">pitt_collection.151</padig:set>
        <padig:set string="Charles C. McGovern Papers">pitt_collection.193</padig:set>
        <padig:set string="Charles M. Stotz Photographs">pitt_collection.37</padig:set>
        <padig:set string="Charles R. Martin Photographs">pitt_collection.38</padig:set>
        <padig:set string="Charles Richardson Photographs">pitt_collection.157</padig:set>
        <padig:set string="Chatham University Chronological Photograph Files">pitt_collection.236</padig:set>
        <padig:set string="Chatham University May Day Collection">pitt_collection.239</padig:set>
        <padig:set string="Chatham University Shadyside Campus Lantern Slide Collection">pitt_collection.237</padig:set>
        <padig:set string="Children's Aid Society of Western Pennsylvania Records">pitt_collection.344</padig:set>
        <padig:set string="Children's Service Bureau Records">pitt_collection.337</padig:set>
        <padig:set string="Christopher Gist's Journals by William M. Darlington">pitt_collection.101</padig:set>
        <padig:set string="City Directories">pitt_collection.49</padig:set>
        <padig:set string="City of Pittsburgh Geodetic and Topographic Survey Maps">pitt_collection.294</padig:set>
        <padig:set string="Communist Collection of A.E. Forbes">pitt_collection.106</padig:set>
        <padig:set string="Conference between the Six Nations and the Quakers Minutes">pitt_collection.144</padig:set>
        <padig:set string="Congregation B'nai Israel Photographs">pitt_collection.154</padig:set>
        <padig:set string="Coroner's Office Records, Allegheny County, Pa.">pitt_collection.174</padig:set>
        <padig:set string="Crafton Public Library Collection">pitt_collection.353</padig:set>
        <padig:set string="D. L. Clark Company Papers and Photographs">pitt_collection.314</padig:set>
        <padig:set string="Daniel Brodhead Papers">pitt_collection.18</padig:set>
        <padig:set string="Darlington Autograph Files">pitt_collection.145</padig:set>
        <padig:set string="Darlington Digital Library">pitt_collection.153</padig:set>
        <padig:set string="Darlington Family Papers">pitt_collection.100</padig:set>
        <padig:set string="Daughters of Erin Court #9 Records">pitt_collection.173</padig:set>
        <padig:set string="Department of Public Health Annual Records, Pittsburgh, PA">pitt_collection.345</padig:set>
        <padig:set string="Dollar Bank Image Collection">pitt_collection.423</padig:set>
        <padig:set string="Donohoe Family Papers">pitt_collection.102</padig:set>
        <padig:set string="Dorsey-Turfley Family Photographs">pitt_collection.40</padig:set>
        <padig:set string="Dunning McNair and Dunning Robert McNair Papers">pitt_collection.19</padig:set>
        <padig:set string="Dwight H Roberts Collection">pitt_collection.336</padig:set>
        <padig:set string="Edward J. Shourek Photographs">pitt_collection.41</padig:set>
        <padig:set string="Eichleay Engineering Corporation Records and Photographs">pitt_collection.243</padig:set>
        <padig:set string="Eliphalet Smith Account Book">pitt_collection.104</padig:set>
        <padig:set string="Elsie H. Hillman Papers">pitt_collection.182</padig:set>
        <padig:set string="Ephraim Douglass Ledgers">pitt_collection.20</padig:set>
        <padig:set string="Extension of the Pittsburgh City Limits Minute Book">pitt_collection.31</padig:set>
        <padig:set string="F. Theodore Wagner Papers">pitt_collection.42</padig:set>
        <padig:set string="Father Cox Papers">pitt_collection.53</padig:set>
        <padig:set string="First Congregational Church, Etna, Pa. Records">pitt_collection.188</padig:set>
        <padig:set string="First Trinity Evangelical Lutheran Church, Pittsburgh, Pa. Records">pitt_collection.43</padig:set>
        <padig:set string="Flood Commission of Pittsburgh, Pennsylvania">pitt_collection.292</padig:set>
        <padig:set string="Ford E. and Harriet R. Curtis Theatre Collection of Pittsburgh Theatre Programs">pitt_collection.254</padig:set>
        <padig:set string="Frank B. Fairbanks Rail Transportation Archive">pitt_collection.44</padig:set>
        <padig:set string="Frank Bolden Papers">pitt_collection.366</padig:set>
        <padig:set string="Frank France Photographs">pitt_collection.415</padig:set>
        <padig:set string="Frederick T. Gretton Photographs">pitt_collection.45</padig:set>
        <padig:set string="Fuchs Family Papers and Photographs">pitt_collection.46</padig:set>
        <padig:set string="Fur Trader's Journal">pitt_collection.258</padig:set>
        <padig:set string="G.M. Hopkins Company Maps">pitt_collection.240</padig:set>
        <padig:set string="George Westinghouse Museum Collection">pitt_collection.286</padig:set>
        <padig:set string="Greenstone United Methodist Church, Avalon, Pa. Records">pitt_collection.17</padig:set>
        <padig:set string="Gulf Oil Corporation Records">pitt_collection.290</padig:set>
        <padig:set string="H.H. Seiferth Sign Company Photographs">pitt_collection.161</padig:set>
        <padig:set string="H.J. Heinz Company Photographs">pitt_collection.47</padig:set>
        <padig:set string="H.K. Porter Co., Pittsburgh, Pa. Records">pitt_collection.247</padig:set>
        <padig:set string="Harold Corsini Photographs">pitt_collection.146</padig:set>
        <padig:set string="Harold V. Cohen Photographs">pitt_collection.312</padig:set>
        <padig:set string="Harper Family Papers">pitt_collection.356</padig:set>
        <padig:set string="Hebrew Institute Photographs">pitt_collection.48</padig:set>
        <padig:set string="Henry Clay Frick Business Records">pitt_collection.156</padig:set>
        <padig:set string="Henry Ellenbogen Papers">pitt_collection.417</padig:set>
        <padig:set string="Henry Marie Brackenridge and Family Papers">pitt_collection.103</padig:set>
        <padig:set string="Herb Ferguson Photographs">pitt_collection.384</padig:set>
        <padig:set string="Historic Pittsburgh Book Collection">pitt_collection.241</padig:set>
        <padig:set string="Historical Society of Upper St. Clair Collection">pitt_collection.50</padig:set>
        <padig:set string="Homer S. Brown Papers">pitt_collection.352</padig:set>
        <padig:set string="Hotel Schenley Register">pitt_collection.175</padig:set>
        <padig:set string="Howard Etzel Photograph Collection">pitt_collection.310</padig:set>
        <padig:set string="Hugh Henry Brackenridge and Andrew Watson Papers">pitt_collection.21</padig:set>
        <padig:set string="Humane Animal Rescue Records and Photographs">pitt_collection.391</padig:set>
        <padig:set string="Irene Kaufmann Settlement Photographs">pitt_collection.51</padig:set>
        <padig:set string="Irish Centre of Pittsburgh Records">pitt_collection.172</padig:set>
        <padig:set string="Iroquois Land Deed">pitt_collection.114</padig:set>
        <padig:set string="Isaac and Samuel Miller Farm Account Book">pitt_collection.273</padig:set>
        <padig:set string="James Benney Photographs">pitt_collection.52</padig:set>
        <padig:set string="James Veech Copybook of the General William Irvine Papers">pitt_collection.22</padig:set>
        <padig:set string="Jennie Bradley Roessing Papers">pitt_collection.343</padig:set>
        <padig:set string="Jewish Sports Hall of Fame of Western Pennsylvania Photographs">pitt_collection.54</padig:set>
        <padig:set string="Jim Papriello Photographs">pitt_collection.441</padig:set>
        <padig:set string="Joel B. Levinson Photographs">pitt_collection.305</padig:set>
        <padig:set string="John Gates Photographs">pitt_collection.55</padig:set>
        <padig:set string="John Lorkovich Undertakers Record Book">pitt_collection.347</padig:set>
        <padig:set string="John M. Tate, Jr. Collection of Notes, Pictures and Documents relating to the Harmony Society">pitt_collection.203</padig:set>
        <padig:set string="John Woodruff Scrapbooks">pitt_collection.184</padig:set>
        <padig:set string="Jonathan Forman Papers">pitt_collection.23</padig:set>
        <padig:set string="Jones &amp; Laughlin Steel Corporation Photographs">pitt_collection.56</padig:set>
        <padig:set string="Juniata Crossings House Records">pitt_collection.303</padig:set>
        <padig:set string="Kaufmann's Department Store Photographs">pitt_collection.318</padig:set>
        <padig:set string="Ken Kobus Collection">pitt_collection.57</padig:set>
        <padig:set string="Kennywood Park Records">pitt_collection.362</padig:set>
        <padig:set string="Kingsley Association Records">pitt_collection.58</padig:set>
        <padig:set string="Louis Semple Clarke Collection">pitt_collection.333</padig:set>
        <padig:set string="Lyon, Shorb &amp; Company Photographs">pitt_collection.59</padig:set>
        <padig:set string="M. Stanford Jackson Papers">pitt_collection.281</padig:set>
        <padig:set string="March of the Pittsburgh Blues Copybook">pitt_collection.98</padig:set>
        <padig:set string="Marshall W. &quot;Major&quot; Taylor Scrapbooks">pitt_collection.202</padig:set>
        <padig:set string="Mary Elinor Lazenby Papers">pitt_collection.275</padig:set>
        <padig:set string="Mary Roberts Rinehart Papers">pitt_collection.185</padig:set>
        <padig:set string="Maurice Levy Oral History of Music in Pittsburgh Collection">pitt_collection.442</padig:set>
        <padig:set string="Max A. Lauffer Papers">pitt_collection.197</padig:set>
        <padig:set string="McConway and Torely Company Records">pitt_collection.322</padig:set>
        <padig:set string="McFarland-Hall-Beck Families Papers">pitt_collection.201</padig:set>
        <padig:set string="Mellon Bank Records">pitt_collection.287</padig:set>
        <padig:set string="Melvin Seidenberg Photographs">pitt_collection.332</padig:set>
        <padig:set string="Mesta Machine Company Photographs">pitt_collection.60</padig:set>
        <padig:set string="Monongahela Navigation Company Copybook">pitt_collection.24</padig:set>
        <padig:set string="Monongahela Railway Company Photographs">pitt_collection.61</padig:set>
        <padig:set string="Monroeville Historical Society Collection">pitt_collection.62</padig:set>
        <padig:set string="Montefiore Hospital Photographs">pitt_collection.86</padig:set>
        <padig:set string="Mrs. Hanlin's Diary">pitt_collection.204</padig:set>
        <padig:set string="National Council of Jewish Women (NCJW), Pittsburgh Section, Records">pitt_collection.110</padig:set>
        <padig:set string="National Organization for Women (NOW) Newsletters">pitt_collection.355</padig:set>
        <padig:set string="Northern Liberties Bridge Company Ledger">pitt_collection.63</padig:set>
        <padig:set string="Northland Historical Image Collection">pitt_collection.64</padig:set>
        <padig:set string="Oakmont Historical Image Collection">pitt_collection.65</padig:set>
        <padig:set string="Ohio Company Papers">pitt_collection.25</padig:set>
        <padig:set string="Oliver M. Kaufmann Photograph Collection of the Irene Kaufmann Settlement">pitt_collection.66</padig:set>
        <padig:set string="Otto's Suburban Dairy Photographs">pitt_collection.67</padig:set>
        <padig:set string="PPG Industries Records">pitt_collection.291</padig:set>
        <padig:set string="Patricia Clapp Papers">pitt_collection.339</padig:set>
        <padig:set string="Paul Lawrence Peeler Papers and Photographs">pitt_collection.315</padig:set>
        <padig:set string="Paul Slantis Photographs">pitt_collection.68</padig:set>
        <padig:set string="Pennsylvania Railroad Photographs">pitt_collection.69</padig:set>
        <padig:set string="Pitcairn Historical Society Image Collection">pitt_collection.70</padig:set>
        <padig:set string="Pittsburgh Academy of Medicine">pitt_collection.346</padig:set>
        <padig:set string="Pittsburgh Bureau of Building Inspection Photographs">pitt_collection.155</padig:set>
        <padig:set string="Pittsburgh Census Tract Maps and Data">pitt_collection.329</padig:set>
        <padig:set string="Pittsburgh City Photographer Collection">pitt_collection.72</padig:set>
        <padig:set string="Pittsburgh Folk Festival Records and Photographs">pitt_collection.418</padig:set>
        <padig:set string="Pittsburgh International Lesbian and Gay Film Festival Records">pitt_collection.359</padig:set>
        <padig:set string="Pittsburgh Photographic Library Collection">pitt_collection.317</padig:set>
        <padig:set string="Pittsburgh Prints from the Collection of Wesley Pickard">pitt_collection.73</padig:set>
        <padig:set string="Pittsburgh Public Schools Photographs">pitt_collection.74</padig:set>
        <padig:set string="Pittsburgh Railways Company Records">pitt_collection.75</padig:set>
        <padig:set string="Pittsburgh Speech and Society Project">pitt_collection.152</padig:set>
        <padig:set string="Pittsburgh Symphony Orchestra Posters">pitt_collection.150</padig:set>
        <padig:set string="Pittsburgh Theatre">pitt_collection.10</padig:set>
        <padig:set string="Pittsburgh Waste Book and Fort Pitt Trading Post Papers">pitt_collection.99</padig:set>
        <padig:set string="Pittsburgh and Lake Erie Railroad Company Records">pitt_collection.71</padig:set>
        <padig:set string="Pittsburgh, Fort Wayne, and Chicago Railway Company Photographs">pitt_collection.76</padig:set>
        <padig:set string="Point Park University Archives">pitt_collection.77</padig:set>
        <padig:set string="Proceedings of the Allegheny County (Pa.) Office of the Coroner's Open Inquest into the death of Jonny Gammage">pitt_collection.351</padig:set>
        <padig:set string="Progress Photographs: William Penn Hotel">pitt_collection.78</padig:set>
        <padig:set string="Rachel Carson Collection">pitt_collection.238</padig:set>
        <padig:set string="Railroad Stock Certificate Collection">pitt_collection.250</padig:set>
        <padig:set string="Reverend David J. Beale Collection">pitt_collection.361</padig:set>
        <padig:set string="Richard E. Rauh Photographs">pitt_collection.87</padig:set>
        <padig:set string="Robert G. Pflaum Photograph Collection">pitt_collection.147</padig:set>
        <padig:set string="Robert J. Walker Papers">pitt_collection.119</padig:set>
        <padig:set string="Robert McKnight Diaries">pitt_collection.26</padig:set>
        <padig:set string="Robert Stobo Papers">pitt_collection.27</padig:set>
        <padig:set string="Rodef Shalom Congregation Photographs">pitt_collection.79</padig:set>
        <padig:set string="Rolling Rock Training Camp Ledger">pitt_collection.28</padig:set>
        <padig:set string="Royal Kane Photographs">pitt_collection.365</padig:set>
        <padig:set string="Russell H. Heffley Photographs">pitt_collection.148</padig:set>
        <padig:set string="Rust Engineering Company Records">pitt_collection.80</padig:set>
        <padig:set string="Samuel A. Musgrave Photographs">pitt_collection.289</padig:set>
        <padig:set string="Schnabel Company Photographs">pitt_collection.313</padig:set>
        <padig:set string="Seder Family Photographs">pitt_collection.81</padig:set>
        <padig:set string="Shadyside Hospital Records">pitt_collection.334</padig:set>
        <padig:set string="Sisters of St. Joseph of Baden Oral History Collection, 1979-1983, 1990">pitt_collection.386</padig:set>
        <padig:set string="Smoke Control Lantern Slides">pitt_collection.82</padig:set>
        <padig:set string="Spencer Family Photographs">pitt_collection.83</padig:set>
        <padig:set string="Squirrel Hill Historical Society and Squirrel Hill Urban Coalition Photograph Collection">pitt_collection.397</padig:set>
        <padig:set string="St. Luke’s Lutheran Church (West View, Pa.) Records and Photographs">pitt_collection.375</padig:set>
        <padig:set string="Stephen Foster Collection">pitt_collection.111</padig:set>
        <padig:set string="Stereoviews of the Railroad Strike of 1877">pitt_collection.390</padig:set>
        <padig:set string="Tarentum Oral Histories: Voices of Faith, Years of Change, 1995">pitt_collection.388</padig:set>
        <padig:set string="Tax-Book of Pitt Township, Allegheny County, Pa.">pitt_collection.84</padig:set>
        <padig:set string="Teenie Harris Photographs">pitt_collection.85</padig:set>
        <padig:set string="The Bulletin, Pittsburg Bulletin, and The Bulletin Index">pitt_collection.324</padig:set>
        <padig:set string="Thomas C. Brogan Papers on The Mayor's Task Force of Civil Disorders">pitt_collection.350</padig:set>
        <padig:set string="Thomas Mellon Galey Photographs">pitt_collection.321</padig:set>
        <padig:set string="Thomas Mellon and William B. Negley Day Book">pitt_collection.29</padig:set>
        <padig:set string="Thorn Hill School for Boys Records">pitt_collection.382</padig:set>
        <padig:set string="Trimble Company Records">pitt_collection.88</padig:set>
        <padig:set string="Union Arcade Building Photographs">pitt_collection.90</padig:set>
        <padig:set string="Union Switch &amp; Signal Strike Photographs">pitt_collection.91</padig:set>
        <padig:set string="United Electrical, Radio, and Machine Workers of America (UE) Records">pitt_collection.89</padig:set>
        <padig:set string="United Jewish Federation of Greater Pittsburgh Photographs">pitt_collection.162</padig:set>
        <padig:set string="United States Army Corps of Engineers, Pittsburgh District Glass Plate Negatives">pitt_collection.316</padig:set>
        <padig:set string="University of Pittsburgh Historic Photographs">pitt_collection.109</padig:set>
        <padig:set string="Urban League of Pittsburgh Records">pitt_collection.92</padig:set>
        <padig:set string="W.B. Austen Diary">pitt_collection.261</padig:set>
        <padig:set string="Walter J. Teskey Photographs">pitt_collection.93</padig:set>
        <padig:set string="Warrantee Atlas of Allegheny County, Pennsylvania">pitt_collection.293</padig:set>
        <padig:set string="Western Pennsylvania Hospital and Dixmont Hospital Records">pitt_collection.195</padig:set>
        <padig:set string="Western Pennsylvania Maps">pitt_collection.97</padig:set>
        <padig:set string="Westinghouse Electric Corporation Photographs">pitt_collection.283</padig:set>
        <padig:set string="William G. Beal Moving Images">pitt_collection.296</padig:set>
        <padig:set string="William H. Wolf Photographs">pitt_collection.94</padig:set>
        <padig:set string="William J. Gaughan Collection">pitt_collection.95</padig:set>
        <padig:set string="William M. Darlington Collection of Fort Pitt Copybooks">pitt_collection.30</padig:set>
        <padig:set string="William Pitt Family Papers">pitt_collection.117</padig:set>
        <padig:set string="William V. Winans Jr. Photographs">pitt_collection.96</padig:set>
        <padig:set string="Woman's Christian Temperance Union, Wilkinsburg, Pa. Records">pitt_collection.205</padig:set>

        <!-- Lafayette -->
        <padig:set string="Aya">collection:AYA</padig:set>
        <padig:set string="College Archives Image Collection">collection:College+Archives+Image+Collection</padig:set>
        <padig:set string="Commencement Programs">collection:Commencement+Programs</padig:set>
        <padig:set string="General Eisenhower at Lafayette: Founders' Day 1946">collection:General+Eisenhower+at+Lafayette%3A+Founders%27+Day+1946</padig:set>
        <padig:set string="Gerald And Rella Warner Dutch East Indies Negatives">collection:Gerald+and+Rella+Warner+Dutch+East+Indies+Negatives</padig:set>
        <padig:set string="Gerald And Rella Warner Japan Slides">collection:Gerald+and+Rella+Warner+Japan+Slides</padig:set>
        <padig:set string="Gerald And Rella Warner Manchuria Negatives">collection:Gerald+and+Rella+Warner+Manchuria+Negatives</padig:set>
        <padig:set string="Gerald And Rella Warner Postcards">collection:Gerald+and+Rella+Warner+Postcards</padig:set>
        <padig:set string="Hubbard Collection of Letters from the Marquis de Lafayette to George Washington">collection:Hubbard+Collection+of+Letters+from+the+Marquis+de+Lafayette+to+George+Washington</padig:set>
        <padig:set string="Lafayette Newspaper Archive">collection:Lafayette+Newspaper+archive</padig:set>
        <padig:set string="Lafayette Magazine Archive">collection:Lafayette+Magazine+archive</padig:set>
        <padig:set string="Marquis De Lafayette Prints Collection">collection:Marquis+de+Lafayette+Prints+Collection</padig:set>
        <padig:set string="Marquis Magazine">collection:Marquis+Magazine</padig:set>
        <padig:set string="McKelvy House">collection:McKelvy+House</padig:set>
        <padig:set string="Pacific War Postcards">collection:Pacific+War+Postcards</padig:set>

        <!-- LaSalle Bepress -->
        <padig:set string="La Salle Alumni Association Newsletter">publication:alumni_assoc_newsletter</padig:set>
        <padig:set string="La Salle College Alumni News">publication:alumni_news</padig:set>
        <padig:set string="La Salle Alumnus">publication:alumnus</padig:set>
        <padig:set string="Explorer News">publication:athletics_explorer_news</padig:set>
        <padig:set string="La Salle Basketball Game Programs">publication:basketball_game_programs</padig:set>
        <padig:set string="La Salle Basketball Media Guides">publication:basketball_media_guides</padig:set>
        <padig:set string="Campus News">publication:campus_news</padig:set>
        <padig:set string="College Budget">publication:college_budget</padig:set>
        <padig:set string="La Salle Commencement Programs">publication:commencement_programs</padig:set>
        <padig:set string="La Salle Course Catalogs">publication:course_catalogs</padig:set>
        <padig:set string="Ebony Voice">publication:ebony_voice</padig:set>
        <padig:set string="Local History Essays">publication:essays</padig:set>
        <padig:set string="Explorations">publication:explorations</padig:set>
        <padig:set string="Explorer (Yearbooks)">publication:explorer</padig:set>
        <padig:set string="Explorer Update">publication:explorer_update</padig:set>
        <padig:set string="La Salle Alumni Association Explorer News">publication:explorer_news</padig:set>
        <padig:set string="Faculty Bulletins">publication:faculty_bulletins</padig:set>
        <padig:set string="Four Quarters">publication:fourquarters</padig:set>
        <padig:set string="Faculty and Staff Directories">publication:faculty_staff_directories</padig:set>
        <padig:set string="Gender Lines">publication:gender_lines</padig:set>
        <padig:set string="Grimoire">publication:grimoire</padig:set>
        <padig:set string="La Salle College Guild">publication:lasalle_college_guild</padig:set>
        <padig:set string="La Salle Explorer">publication:lasalle_explorer</padig:set>
        <padig:set string="La Salle Magazine">publication:lasalle_magazine</padig:set>
        <padig:set string="Men of La Salle">publication:men_of_lasalle</padig:set>
        <padig:set string="Parents' Newsletter">publication:parents_newsletter</padig:set>
        <padig:set string="La Salle Press Releases">publication:press_releases</padig:set>
        <padig:set string="La Salle Student Handbooks">publication:student_handbooks</padig:set>
        <padig:set string="Interviews">publication:vietnam_interviews</padig:set>

        <!-- LaSalle CDM -->
        <padig:set string="Rick McCarty PTSD Drawings">p15860coll1</padig:set>
        <padig:set string="Nina Talbot, Veterans">p15860coll5</padig:set>
        <padig:set string="North Vietnamese Propaganda Posters">p15860coll7</padig:set>

        <!-- Lehigh -->
        <padig:set string="I Remain">letters</padig:set>
        <padig:set string="Postcards">postal</padig:set>

        <!-- Library Company -->
        <!-- Includes setspecs used in variables.json, but also any other setspec that could be a nested collection -->
        <padig:set string="&quot;At the Instance&quot; Illustration Collection">Islandora_ATII1</padig:set>
        <padig:set string="&quot;Saturday Jaunts: One-Day Holidays Spent Near the City&quot; by the Ledger Monastery">Islandora_SATUR</padig:set>
        <padig:set string="19th Century Cloth Bindings Database">Islandora_CLTH1</padig:set>
        <padig:set string="Aero Service Corporation Photographic Negative Collection">Islandora_AERO1</padig:set>
        <padig:set string="African Americana Albums">Islandora_AFAL1</padig:set>
        <padig:set string="African Americana Collection">Islandora_AFAM1</padig:set>
        <padig:set string="African Americana Photographs">Islandora_AFPH1</padig:set>
        <padig:set string="African Americana Political Cartoons">Islandora_AFPC1</padig:set>
        <padig:set string="African Americana Prints and Watercolors and Drawings">Islandora_AAPR1</padig:set>
        <padig:set string="African Americana from the Thomas Richardson Scrapbook">Islandora_AALM1</padig:set>
        <padig:set string="Albert Hatch Photograph Album">Islandora_HATC1</padig:set>
        <padig:set string="Album Collection">Islandora_ALBUM</padig:set>
        <padig:set string="Alfred Hand Photographic Negative Collection">Islandora_HAND1</padig:set>
        <padig:set string="Amateur Newspapers and Journals Collection">Islandora_AMANE</padig:set>
        <padig:set string="American Antiquarian Society Collections">Islandora_AAS01</padig:set>
        <padig:set string="American Celebrities Albums">Islandora_AMCE1</padig:set>
        <padig:set string="American Song Sheets, Slip Ballads and Poetical Broadsides Collection">Islandora_ASP01</padig:set>
        <padig:set string="Amy Matilda Cassey Album">Islandora_CASS1</padig:set>
        <padig:set string="Ann's Collections Upload Workspace 2">Islandora_ANNS2</padig:set>
        <padig:set string="Art and Artifacts Collection">Islandora_AART1</padig:set>
        <padig:set string="Arthur Power Dudden Travel Ephemera Collection">Islandora_DUDDE</padig:set>
        <padig:set string="Atwater Kent Museum | Print Department Collections">Islandora_AKM01</padig:set>
        <padig:set string="Baltimore &amp; Ohio Railroad Album">Islandora_BORR1</padig:set>
        <padig:set string="Barbara A. Townshind Silhouette Album">Islandora_TOWN1</padig:set>
        <padig:set string="Bartlett &amp; French Stereograph Collection">Islandora_BFST1</padig:set>
        <padig:set string="Bartlett &amp; Smith Stereograph Collection">Islandora_BASM1</padig:set>
        <padig:set string="Benjamin Evans Watercolor Collection">Islandora_EVAN1</padig:set>
        <padig:set string="Bits of Nature and Some Art Products in Fairmount Park at Philadelphia, Penna.">Islandora_KOLL1</padig:set>
        <padig:set string="Book Collections">Islandora_BOOK1</padig:set>
        <padig:set string="Brightbill Postcard Collection">Islandora_BRIG1</padig:set>
        <padig:set string="Capitalism by Gaslight: The Shadow Economies of 19th-Century America">Islandora_CBG01</padig:set>
        <padig:set string="Cased Photograph Collection">Islandora_CASE1</padig:set>
        <padig:set string="Centennial Exhibition Philadelphia Album">Islandora_CENT1</padig:set>
        <padig:set string="Centennial Exhibition Wooden Views">Islandora_CENT2</padig:set>
        <padig:set string="Centennial Photographic Company Collection">Islandora_CPCC1</padig:set>
        <padig:set string="Charles A. Poulson Philadelphia Scrapbooks">Islandora_POUL1</padig:set>
        <padig:set string="Civil War Broadsides">Islandora_CWBR1</padig:set>
        <padig:set string="Civil War Campaigns &amp; Battes">Islandora_CVCB1</padig:set>
        <padig:set string="Civil War Collecting Cards">Islandora_MCBP2</padig:set>
        <padig:set string="Civil War Envelopes &amp; Stationery">Islandora_CVEN1</padig:set>
        <padig:set string="Civil War Graphics and Ephemera">Islandora_CWGE1</padig:set>
        <padig:set string="Civil War Hospitals">Islandora_CVHO1</padig:set>
        <padig:set string="Civil War Military Camps">Islandora_CVMC1</padig:set>
        <padig:set string="Civil War Miscellany">Islandora_CVMS1</padig:set>
        <padig:set string="Civil War Paper Soldiers Collection">Islandora_CVPS1</padig:set>
        <padig:set string="Civil War Photographs">Islandora_CWPH1</padig:set>
        <padig:set string="Civil War Playbills">Islandora_CWPB1</padig:set>
        <padig:set string="Civil War Political Cartoons">Islandora_CWPC1</padig:set>
        <padig:set string="Civil War Recruiting Poster Illustrations">Islandora_CVRP1</padig:set>
        <padig:set string="Civil War Scrapbooks">Islandora_CWSB1</padig:set>
        <padig:set string="Civil War Sheet Music">Islandora_CWSM1</padig:set>
        <padig:set string="Civil War Volunteer Refreshment Saloons">Islandora_CVVRS</padig:set>
        <padig:set string="Comic Valentine Collection">Islandora_MCAV1</padig:set>
        <padig:set string="Darby Library Company Collection">Islandora_DAR01</padig:set>
        <padig:set string="David Doret Ephemera Collection">Islandora_DORE2</padig:set>
        <padig:set string="Dickerson Family Cased Portrait Collection">Islandora_DIFA1</padig:set>
        <padig:set string="Dickerson Family Collection">Islandora_DICM3</padig:set>
        <padig:set string="Engravings by William Humphrys Scrapbook">Islandora_HUMP1</padig:set>
        <padig:set string="Ephemera Collection">Islandora_EPHEM</padig:set>
        <padig:set string="Eugene Davis Philadelphia Street Railway Electrification Photograph Collection">Islandora_RAIL1</padig:set>
        <padig:set string="Fashioning Philadelphia: The Style of the City, 1720-1940">Islandora_FPHIL</padig:set>
        <padig:set string="Fels African Americana Image Project">Islandora_FELS2</padig:set>
        <padig:set string="Frank Berry Photographic Negative Collection">Islandora_BERR1</padig:set>
        <padig:set string="Frank H. Taylor Illustration Collection">Islandora_TAYL1</padig:set>
        <padig:set string="Frank W. Kohler Bicycling Events Scrapbook">Islandora_KOHL1</padig:set>
        <padig:set string="Frankford Elevated Railway Construction Photograph Collection">Islandora_FERC1</padig:set>
        <padig:set string="Frederick De Bourg Richards Photograph Collection">Islandora_FDBR1</padig:set>
        <padig:set string="Frederick Gutekunst Pennsylvania Railroad Stereograph Collection">Islandora_GUTE4</padig:set>
        <padig:set string="Free Library of Philadelphia. | Print and Picture Collection">Islandora_FLP01</padig:set>
        <padig:set string="George Albert Lewis Old Houses and Stores Album">Islandora_LEWI2</padig:set>
        <padig:set string="George Mark Wilson Photograph Collection">Islandora_WILS1</padig:set>
        <padig:set string="Helen Beitler Graphic Ephemera Collection">Islandora_BEIT1</padig:set>
        <padig:set string="Henry B. Odiorne Photograph Collection">Islandora_ODIO1</padig:set>
        <padig:set string="Historical Society of Pennsylvania Collections">Islandora_HSP01</padig:set>
        <padig:set string="Improved Authors with Portraits &amp; Autographs Card Game">Islandora_MCCL1</padig:set>
        <padig:set string="Jackson-Cross Company Realtors Property Photograph Collection">Islandora_JACR1</padig:set>
        <padig:set string="James McClees Philadelphia Photograph Collection">Islandora_CLEE1</padig:set>
        <padig:set string="Jennings Fidelity-Philadelphia Trust Company Building Construction Photograph Collection">Islandora_JEFI1</padig:set>
        <padig:set string="John C. Browne Photograph Albums">Islandora_BROW2</padig:set>
        <padig:set string="John C. Bullock Lantern Slide Collection">Islandora_BULL1</padig:set>
        <padig:set string="John Frank Keith Photograph Collection">Islandora_KEI01</padig:set>
        <padig:set string="John J. Smith and Rachel Collins Pearsall Smith Family Photograph Album">Islandora_SMIT1</padig:set>
        <padig:set string="John Serz Scrapbook">Islandora_SERZ1</padig:set>
        <padig:set string="Johns Hopkins University | Special Collections at the Sheridan Libraries">Islandora_JHU01</padig:set>
        <padig:set string="Library Company Postcard Collection">Islandora_POST1</padig:set>
        <padig:set string="Library Company Unified Discovery Search">islandora_discovery</padig:set>
        <padig:set string="Library Company of Philadelphia Historic Shareholders Database">Islandora_HSDB1</padig:set>
        <padig:set string="Library Company of Philadelphia Menus and Culinary History Collection">Islandora_LCPME</padig:set>
        <padig:set string="Library Company of Philadelphia Miscellaneous Ephemera Collection">Islandora_LCP03</padig:set>
        <padig:set string="Library Company of Philadelphia Scrapbooks">Islandora_LCP01</padig:set>
        <padig:set string="Library Company of Philadelphia finding aids">Islandora_MSS01</padig:set>
        <padig:set string="Library of Congress Collections">Islandora_LOC01</padig:set>
        <padig:set string="Life in New York Collection">Islandora_LNYC1</padig:set>
        <padig:set string="Life in Philadelphia Collection">Islandora_LINP1</padig:set>
        <padig:set string="Louella: Home of J. Henry Askin Album">Islandora_GUTE2</padig:set>
        <padig:set string="Louisa A. White Album">Islandora_LAW01</padig:set>
        <padig:set string="Manuscript Series Collections">Islandora_MANU1</padig:set>
        <padig:set string="Map Collection">Islandora_MAPS1</padig:set>
        <padig:set string="Marriott C. Morris Collection">Islandora_MORR1</padig:set>
        <padig:set string="Marriott C. Morris Collection Negatives">Islandora_MORR3</padig:set>
        <padig:set string="Marriott C. Morris Collection Prints">Islandora_MORR2</padig:set>
        <padig:set string="Marriott C. Morris Collection Scrapbooks">Islandora_MORR5</padig:set>
        <padig:set string="Marriott C. Morris Collection Slides">Islandora_MORR4</padig:set>
        <padig:set string="Martina Dickerson Album">Islandora_DICM1</padig:set>
        <padig:set string="Mary Anne Dickerson Album">Islandora_DICM2</padig:set>
        <padig:set string="Mary Langdale Coates Account Book">Islandora_COAT1</padig:set>
        <padig:set string="Mary McPhilomy Portrait Photograph Album">Islandora_MCPH1</padig:set>
        <padig:set string="Mary Rebecca Darby Smith Scrapbooks">Islandora_SMIT2</padig:set>
        <padig:set string="Max Rosenthal Collection of Portraits Scrapbook">Islandora_ROSE1</padig:set>
        <padig:set string="McAllister &amp; Brother Church Photograph Collection">Islandora_CHUR1</padig:set>
        <padig:set string="McAllister Civil War Prints, Ephemera, and Scrapbooks">Islandora_CIVL1</padig:set>
        <padig:set string="McAllister Family Collection">Islandora_MCAFC</padig:set>
        <padig:set string="Memories of the home of Grandma Lewis Scrapbook">Islandora_LEWI1</padig:set>
        <padig:set string="Michael Zinman Blank Forms Collection">Islandora_ZINM3</padig:set>
        <padig:set string="Michael Zinman Collection">Islandora_ZINM1</padig:set>
        <padig:set string="Michael Zinman Ephemera Collection">Islandora_ZINM4</padig:set>
        <padig:set string="Michael Zinman Raised Letter Publications">Islandora_ZINM6</padig:set>
        <padig:set string="Michael Zinman World's Fairs Collection">Islandora_ZINM2</padig:set>
        <padig:set string="Miscellaneous Collections">Islandora_MIS01</padig:set>
        <padig:set string="Miscellaneous Collections">Islandora_MISCE</padig:set>
        <padig:set string="Mixed Media Scrapbooks">Islandora_MMSCR</padig:set>
        <padig:set string="Montgomery P. Simons Philadelphia Stereograph Collection">Islandora_MONT1</padig:set>
        <padig:set string="Nature Prints of Leaves Albums">Islandora_BREI1</padig:set>
        <padig:set string="Old Landmarks and Relics of Philadelphia Album, Fourth Series">Islandora_NEWE4</padig:set>
        <padig:set string="Old Landmarks and Relics of Philadelphia Album, Second Series">Islandora_NEWE3</padig:set>
        <padig:set string="Old Philadelphia Views Album">Islandora_MORA3</padig:set>
        <padig:set string="Pawson &amp; Nicholson Photograph Album">Islandora_PAWS1</padig:set>
        <padig:set string="Pennsylvania Capitol Collection">Islandora_PACC1</padig:set>
        <padig:set string="Peter Collinson's 1739 Annotated First Edition of the &quot;History of London&quot;">Islandora_COLL1</padig:set>
        <padig:set string="Peter Moran Sketchbooks">Islandora_PMOR1</padig:set>
        <padig:set string="Philadelphia Archdiocesan Historical Research Center">Islandora_PAH01</padig:set>
        <padig:set string="Philadelphia Zoo Photograph Album">Islandora_PZOO1</padig:set>
        <padig:set string="Philadelphia on Stone">Islandora_POS01</padig:set>
        <padig:set string="Philadelphia on Stone Biographical Dictionary of Lithographers">Islandora_POSB2</padig:set>
        <padig:set string="Philadelphia on Stone Digital Catalog">Islandora_POSL1</padig:set>
        <padig:set string="Philadelphia on Stone: Library Company of Philadelphia">Islandora_LCP04</padig:set>
        <padig:set string="Philip Frey &amp; Co.'s Centennial Exhibition Souvenir Viewbook">Islandora_FREY1</padig:set>
        <padig:set string="Photograph Album of Philadelphia and Vicinity">Islandora_NEWE5</padig:set>
        <padig:set string="Photographic Albums">Islandora_PHALB</padig:set>
        <padig:set string="Photographic Views of Philadelphia's New City Building">Islandora_CREM1</padig:set>
        <padig:set string="Political Cartoons Collection">Islandora_POLCA</padig:set>
        <padig:set string="Popular Medicine Collection">Islandora_PMED1</padig:set>
        <padig:set string="Portrait Album of Well-Known 19th-Century African American Men of Philadelphia">Islandora_WEL01</padig:set>
        <padig:set string="Portrait Prints and Boxiana Album">Islandora_BOXI1</padig:set>
        <padig:set string="Portraits of American Women">Islandora_AMWO1</padig:set>
        <padig:set string="Postcard Collection">Islandora_CARD1</padig:set>
        <padig:set string="Publications by Library Company of Philadelphia Staff">Islandora_PUBS1</padig:set>
        <padig:set string="Published Albums">Islandora_PUBAS</padig:set>
        <padig:set string="Rae's Philadelphia Pictorial Directory &amp; Panoramic Advertiser">Islandora_RAE01</padig:set>
        <padig:set string="Richard DeReef Venning Photograph Album">Islandora_SVRV1</padig:set>
        <padig:set string="Robert Redfield Photograph Collection">Islandora_REDF1</padig:set>
        <padig:set string="Roughwood Collection">Islandora_ROUGH</padig:set>
        <padig:set string="Scenery on the Pennsylvania Railroad Album">Islandora_GUTE3</padig:set>
        <padig:set string="Scrapbook of Engravings, Lithographs, and Photographs">Islandora_GODL1</padig:set>
        <padig:set string="Scrapbook of Ephemera">Islandora_STCOE</padig:set>
        <padig:set string="Scrapbook of Greeting Cards, Menus, Invitations, etc.">Islandora_HARR1</padig:set>
        <padig:set string="Scrapbook of Greeting Cards, Programs, etc.">Islandora_HARR2</padig:set>
        <padig:set string="Scrapbook of Prints">Islandora_SOP01</padig:set>
        <padig:set string="Scrapbook of Trade Cards, Holiday Cards, etc.">Islandora_STCHC</padig:set>
        <padig:set string="Scrapbook with periodical illustrations, comic valentines, and patent medicine advertisements">Islandora_SCRA1</padig:set>
        <padig:set string="Section through the engine house of the Centre Square Water Works, Philadelphia">Islandora_GRAF1</padig:set>
        <padig:set string="Silhouette Collection">Islandora_SILH1</padig:set>
        <padig:set string="Smithsonian Institution | NMAH Archives Center Warshaw Collection">Islandora_SIAC01</padig:set>
        <padig:set string="Smithsonian Institution | NMAH Home and Community Life Collection">Islandora_SNMA01</padig:set>
        <padig:set string="Specimens Album Loose Prints">Islandora_STEI2</padig:set>
        <padig:set string="Stein &amp; Jones Specimens Album">Islandora_STEI1</padig:set>
        <padig:set string="Stereograph Collection">Islandora_STERE</padig:set>
        <padig:set string="Stevens-Cogdell/Sanders-Venning Collection">Islandora_SCSV1</padig:set>
        <padig:set string="Stevens-Cogdell/Sanders-Venning Collection Photographs">Islandora_SVPH1</padig:set>
        <padig:set string="Teitelman Collection of American Sunday-School Union Woodblocks and Imprints">Islandora_ASSU1</padig:set>
        <padig:set string="The City Hall of Philadelphia, Architecture, Sculpture and History Album">Islandora_FAUS1</padig:set>
        <padig:set string="The Delegates' Library Collection">Islandora_DLIB1</padig:set>
        <padig:set string="The Game of Philadelphia Buildings Flashcards">Islandora_GAME1</padig:set>
        <padig:set string="The Rose and Leon Doret Collection of Business Ephemera">Islandora_DORE3</padig:set>
        <padig:set string="Theatrical and Public Celebrities Catalogue and Photograph Albums">Islandora_GILB1</padig:set>
        <padig:set string="Things Found in Books Collection">Islandora_TFIB1</padig:set>
        <padig:set string="Thomas Eakins' Motion Studies Photographs">Islandora_EAKI1</padig:set>
        <padig:set string="Thomas S. Wagner Wooden Lithographic Puzzles">Islandora_WAGN1</padig:set>
        <padig:set string="Trade Card Collection">Islandora_PHIL1</padig:set>
        <padig:set string="Two Weeks in the Yellowstone, 1887">Islandora_VAUX1</padig:set>
        <padig:set string="Views at Chestnutwold: Residence of C. H. Clark Album">Islandora_NEWE6</padig:set>
        <padig:set string="Views of Ashwood Photograph Albums">Islandora_LEAM1</padig:set>
        <padig:set string="Views of Atlantic City Souvenir Booklet">Islandora_WITTE1</padig:set>
        <padig:set string="Views of Fairmount Park Album">Islandora_CREM2</padig:set>
        <padig:set string="Views of Loudoun &amp; Stenton Album">Islandora_LOUD1</padig:set>
        <padig:set string="Views of Philadelphia Souvenir Booklet">Islandora_WITTE2</padig:set>
        <padig:set string="Wainwright Lithograph Collection">Islandora_WAIN1</padig:set>
        <padig:set string="Webster Family Negative and Photograph Collection">Islandora_WEBS1</padig:set>
        <padig:set string="William H. Helfand Comic Valentine Collection">Islandora_HECV1</padig:set>
        <padig:set string="William H. Helfand Miscellaneous Popular Medicine Ephemera Collection">Islandora_HELF1</padig:set>
        <padig:set string="William H. Helfand Popular Medicine Collection">Islandora_HELF4</padig:set>
        <padig:set string="William H. Helfand Popular Medicine Ephemera Collection">Islandora_HELF2</padig:set>
        <padig:set string="William H. Helfand Popular Medicine Stationery Collection">Islandora_HELF3</padig:set>
        <padig:set string="William Harvey Doering Lantern Slide Collection">Islandora_DOER1</padig:set>
        <padig:set string="William Russell Birch Country Seats">Islandora_WRBC1</padig:set>
        <padig:set string="William Russell Birch Drawings and Watercolors">Islandora_BDW01</padig:set>
        <padig:set string="William Russell Birch Graphics and Manuscripts">Islandora_WRB01</padig:set>
        <padig:set string="William Russell Birch Views of Philadelphia">Islandora_WRBV1</padig:set>
        <padig:set string="William and Frederick Langenheim Stereograph Collection">Islandora_LANG1</padig:set>
        <padig:set string="World War One Collection">Islandora_WWI01</padig:set>
        <padig:set string="World War One Photographs and Ephemera">Islandora_WWIP2</padig:set>
        <padig:set string="World War One Posters">Islandora_WWIP1</padig:set>


        <!-- Millersville -->
        <padig:set string="Millersville University Photograph Collection">mvsphoto</padig:set>
        <padig:set string="Millersville University Postcard Collection">wingpost</padig:set>

        <!-- PCOM -->
        <padig:set string="Classic Osteopathic Medical Works">publication:classic_med_works</padig:set>
        <padig:set string="Commencements">publication:commencements</padig:set>
        <padig:set string="Herald of Osteopathy">publication:herald_of_osteopathy</padig:set>
        <padig:set string="Osteopathic Medicine">publication:osteopathic_medicine</padig:set>
        <padig:set string="Digest">publication:digest</padig:set>
        <padig:set string="Philadelphia Journal of Osteopathy">publication:phila_j_osteopathy</padig:set>
        <padig:set string="The Axone">publication:axone</padig:set>
        <padig:set string="Yearbooks">publication:yearbooks</padig:set>

        <!-- Penn State -->
        <padig:set string="A Few Good Women">afgw</padig:set>
        <padig:set string="A. E. Bye Papers">aebye</padig:set>
        <padig:set string="A. J. Thompson Civil War Diary">ajt</padig:set>
        <padig:set string="Alice Marshall Collection">amc</padig:set>
        <padig:set string="Amalgamated Association of Iron, Steel, and Tin Workers of North America Records">amalgamated</padig:set>
        <padig:set string="American Popular Revolutionary Alliance Party (Peru) Collection">apra</padig:set>
        <padig:set string="Anderson and Ellis Art Education Collection">arted</padig:set>
        <padig:set string="Black History and Visual Culture">blackhistory</padig:set>
        <padig:set string="Brent Wilson Papers">brentwilson</padig:set>
        <padig:set string="Central Pennsylvania Architecture and Landscape Architecture Collection">cpalac</padig:set>
        <padig:set string="Cresson Literary Society Records">cls</padig:set>
        <padig:set string="Daniel Elias Frantz Diary">def</padig:set>
        <padig:set string="Digital Map Drawer">maps1</padig:set>
        <padig:set string="Edwin Forbes Civil War Etchings">Forbes</padig:set>
        <padig:set string="Elisha J. Bracken Civil War Diary">ejb</padig:set>
        <padig:set string="Gender and Sexual Identity and Expression">gender</padig:set>
        <padig:set string="George and Alice Beatty Papers">gbp</padig:set>
        <padig:set string="George Hoenshel Fleming Sr. Family Papers">fleming</padig:set>
        <padig:set string="George Medrick Papers">medrick</padig:set>
        <padig:set string="Harold Rasmussen Scrapbooks, Badges, and Buttons">rasmussen</padig:set>
        <padig:set string="Harriman Alaska Expedition Diary and Artifacts">harriman</padig:set>
        <padig:set string="Hayfield Estate Records, 1925-1945">hayfield</padig:set>
        <padig:set string="Historical Recipe Books">recipes</padig:set>
        <padig:set string="Howard Truman Curtiss Papers">curtiss</padig:set>
        <padig:set string="Jerry Doyle Papers">jdp</padig:set>
        <padig:set string="John Chorey Papers">chorey</padig:set>
        <padig:set string="Joseph Priestley Collection">priestley</padig:set>
        <padig:set string="Kirschner Family Papers">kirschner</padig:set>
        <padig:set string="Mira Dock Lantern Slides">mdfls</padig:set>
        <padig:set string="Morris W. Hackman Civil War Diary">mwh</padig:set>
        <padig:set string="Ogontz Mosaic">omt</padig:set>
        <padig:set string="Penn State Altoona Campus Collections">altoona</padig:set>
        <padig:set string="Penn State Froth">froth</padig:set>
        <padig:set string="Penn State Libraries Photo Archive">psuphoto</padig:set>
        <padig:set string="Penn State Life Science Collections">life_sci</padig:set>
        <padig:set string="Penn State Mont Alto Campus Collections">montalto</padig:set>
        <padig:set string="Penn State University Archives Oral History Collections">oralhistory</padig:set>
        <padig:set string="Pennsylvania Bridges Collection">pab</padig:set>
        <padig:set string="Philip Murray Papers">murray</padig:set>
        <padig:set string="Pinkerton's National Detective Agency">pnd</padig:set>
        <padig:set string="Sarah Chamberlin Eccleston Diary and Journal, 1864-1916">chamberlin</padig:set>
        <padig:set string="Selections from the Historical Print and Manuscripts Collection">manuscripts</padig:set>
        <padig:set string="T. R. Johns">trjohns</padig:set>
        <padig:set string="The Ogontz School for Young Ladies Yearbooks 1898-1950">ogontz</padig:set>
        <padig:set string="Thomas W. Benson Political Protest Collection">benson</padig:set>
        <padig:set string="Union League of Philadelphia Archives">ulp</padig:set>
        <padig:set string="United Mine Workers of America Photographic, Graphic, and Artifacts Collection">umwap</padig:set>
        <padig:set string="United Mine Workers of America, President's Office Correspondence">umwac</padig:set>
        <padig:set string="United Steelworkers of America District 33 Records">district33</padig:set>
        <padig:set string="Walter R. Collins Civil War Diaries and Photograph">wrc</padig:set>
        <padig:set string="War Posters">warposters</padig:set>
        <padig:set string="Washington Literary Society Records, 1859-1895">wls</padig:set>
        <padig:set string="William H.H. Fisher Civil War Diary">whf</padig:set>
        <padig:set string="Women's Suffrage Collection">suffrage</padig:set>
        <padig:set string="World War I Glass Plate Stereographs">ww1stereo</padig:set>
        <padig:set string="WPA Bituminous Coal Mine Maps">wpamaps</padig:set>

        <!-- Presbyterian Historical Society -->
        <padig:set string="Baird Family Papers">islandora_rg316</padig:set>
        <padig:set string="Church Buildings">islandora_churchbuildings</padig:set>
        <padig:set string="Henry Harmon Spalding and Eliza Hart Spalding Papers">islandora_spalding</padig:set>
        <padig:set string="Katie G. Cannon Collection">islandora_kgc</padig:set>
        <padig:set string="Oral Histories Collection">islandora_oralhistories_collection</padig:set>
        <padig:set string="Presbyterian Historical Society Audio Collection">islandora_audio_collection</padig:set>
        <padig:set string="Presbyterian Historical Society Map Collection">islandora_maps</padig:set>
        <padig:set string="Presbyterian Historical Society Portraits">islandora_portraits</padig:set>
        <padig:set string="Presbyterian Historical Society Video Collection">islandora_video_collection</padig:set>
        <padig:set string="Religious News Service Photographs">islandora_rns</padig:set>
        <padig:set string="Relocation of Japanese-Americans during the Second World War">islandora_slides_b34</padig:set>
        <padig:set string="Tehran Community School">islandora_tehran_community_school</padig:set>

        <!-- Slippery Rock -->
        <padig:set string="Slippery Rock University Audio Collection">audio</padig:set>
        <padig:set string="Slippery Rock University Photograph Collection">photograph</padig:set>
        <padig:set string="Slippery Rock University Postcard Collection">postcard</padig:set>
        <padig:set string="Slippery Rock University Yearbooks - The Saxigena (selected years)">yearbooks</padig:set>

        <!-- State Library of Pennsylvania -->
        <padig:set string="Alternative Central Newspaper">155-alternative-central-newspaper</padig:set>
        <padig:set string="Ambler Gazette">201-ambler-gazette</padig:set>
        <padig:set string="America250">158-america250</padig:set>
        <padig:set string="America250: Changing Landscapes">174-america250-changing-landscapes</padig:set>
        <padig:set string="America250: Daily Life">177-america250-daily-life</padig:set>
        <padig:set string="America250: Evolving Memory">173-america250-evolving-memory</padig:set>
        <padig:set string="America250: Politics, Taxes, and Revolution">172-america250-politics-taxes-and</padig:set>
        <padig:set string="America250: Special Populations">178-america250-special-populations</padig:set>
        <padig:set string="Blair County Whig">9-blair-county-whig</padig:set>
        <padig:set string="Board of Inspectors of the New Western Penitentiary State Documents">15-board-of-inspectors-of</padig:set>
        <padig:set string="Board of Inspectors of the Western State Penitentiary State Documents">16-board-of-inspectors-of</padig:set>
        <padig:set string="Board of Probation and Parole State Documents">149-board-of-probation-and</padig:set>
        <padig:set string="Board of Public Charities State Documents">19-board-of-public-charities</padig:set>
        <padig:set string="Board of the Eastern State Penitentiary State Documents">14-board-of-the-eastern</padig:set>
        <padig:set string="Central Voice Collection (All Titles)">157-central-voice-collection-all</padig:set>
        <padig:set string="Central Voice Newspaper">156-central-voice-newspaper</padig:set>
        <padig:set string="Colonization Herald">209-colonization-herald-and-general</padig:set>
        <padig:set string="Commission of Soldiers' Orphan Schools State Documents">189-commission-of-soldiers-orphan</padig:set>
        <padig:set string="Commission on Crime and Delinquency State Documents">20-commission-on-crime-and</padig:set>
        <padig:set string="Commission on Sentencing State Documents">30-commission-on-sentencing-state</padig:set>
        <padig:set string="Council on the Arts State Documents">33-council-on-the-arts</padig:set>
        <padig:set string="Department of Aging State Documents">34-department-of-aging-state</padig:set>
        <padig:set string="Department of Agriculture State Documents">35-department-of-agriculture-state</padig:set>
        <padig:set string="Department of Banking and Securities State Documents">37-department-of-banking-and</padig:set>
        <padig:set string="Department of Banking State Documents">148-department-of-banking-state</padig:set>
        <padig:set string="Department of Community and Economic Development State Documents">38-department-of-community-and</padig:set>
        <padig:set string="Department of Conservation and Natural Resources State Documents">39-department-of-conservation-and</padig:set>
        <padig:set string="Department of Corrections State Documents">40-department-of-corrections-state</padig:set>
        <padig:set string="Department of Education State Documents">41-department-of-education-state</padig:set>
        <padig:set string="Department of Environmental Protection State Documents">42-department-of-environmental-protection</padig:set>
        <padig:set string="Department of Environmental Resources State Documents">186-department-of-environmental-resources</padig:set>
        <padig:set string="Department of Factory Inspection State Documents">43-department-of-factory-inspection</padig:set>
        <padig:set string="Department of Forestry State Documents">181-department-of-forestry-state</padig:set>
        <padig:set string="Department of Forests and Waters State Documents">44-department-of-forests-and</padig:set>
        <padig:set string="Department of General Services State Documents">46-department-of-general-services</padig:set>
        <padig:set string="Department of Health State Documents">57-department-of-health-state</padig:set>
        <padig:set string="Department of Highways State Documents">146-department-of-highways-state</padig:set>
        <padig:set string="Department of Human Services State Documents">64-department-of-human-services</padig:set>
        <padig:set string="Department of Internal Affairs State Documents">66-department-of-internal-affairs</padig:set>
        <padig:set string="Department of Justice State Documents">188-department-of-justice-state</padig:set>
        <padig:set string="Department of Labor and Industry State Documents">67-department-of-labor-and</padig:set>
        <padig:set string="Department of Military and Veterans' Affairs State Documents">68-department-of-military-and</padig:set>
        <padig:set string="Department of Mines State Documents">69-department-of-mines-state</padig:set>
        <padig:set string="Department of Public Assistance State Documents">70-department-of-public-assistance</padig:set>
        <padig:set string="Department of Public Instruction State Documents">71-department-of-public-instruction</padig:set>
        <padig:set string="Department of Public Printing and Binding State Documents">72-department-of-public-printing</padig:set>
        <padig:set string="Department of Public Welfare State Documents">73-department-of-public-welfare</padig:set>
        <padig:set string="Department of Revenue State Documents">74-department-of-revenue-state</padig:set>
        <padig:set string="Department of State State Documents">77-department-of-state-state</padig:set>
        <padig:set string="Department of the Auditor General State Documents">36-department-of-the-auditor</padig:set>
        <padig:set string="Department of Transportation State Documents">78-department-of-transportation-state</padig:set>
        <padig:set string="Der Libanoner Morgenstern Newspaper">195-der-libanoner-morgenstern-newspaper</padig:set>
        <padig:set string="Dollar Newspaper">12-dollar-newspaper</padig:set>
        <padig:set string="Dunlap's Pennsylvania Packet, or, the General Advertiser">207-dunlaps-pennsylvania-packet-or</padig:set>
        <padig:set string="Family Trees and Records">10-family-trees-and-records</padig:set>
        <padig:set string="Fish and Boat Commission State Documents">21-fish-and-boat-commission</padig:set>
        <padig:set string="Franklin Review">202-franklin-review</padig:set>
        <padig:set string="Game Commission State Documents">22-game-commission-state-documents</padig:set>
        <padig:set string="Gaming Control Board State Documents">13-gaming-control-board-state</padig:set>
        <padig:set string="General Collections">187-general-collections</padig:set>
        <padig:set string="German Language Newspapers">11-german-language-newspapers</padig:set>
        <padig:set string="Governor's Cabinet on Children and Families State Documents">87-governors-cabinet-on-children</padig:set>
        <padig:set string="Governor's Invasive Species Council State Documents">196-governors-invasive-species-council</padig:set>
        <padig:set string="Harrisburg Necrology Scrapbooks">165-harrisburg-necrology-scrapbooks</padig:set>
        <padig:set string="Harrisburg Newspaper Index">159-harrisburg-newspaper-index</padig:set>
        <padig:set string="Historical and Museum Commission State Documents">23-historical-and-museum-commission</padig:set>
        <padig:set string="Human Relations Commission State Documents">24-human-relations-commission-state</padig:set>
        <padig:set string="Independent Regulatory Review Commission State Documents">25-independent-regulatory-review-commission</padig:set>
        <padig:set string="Insurance Department State Documents">65-insurance-department-state-documents</padig:set>
        <padig:set string="Joint Legislative Air and Water Pollution Control and Conservation Committee State Documents">92-joint-legislative-air-and</padig:set>
        <padig:set string="Joint State Government Commission State Documents">26-joint-state-government-commission</padig:set>
        <padig:set string="Juvenile Court Judges' Commission State Documents">27-juvenile-court-judges-commission</padig:set>
        <padig:set string="Legislative Audit Advisory Commission State Documents">94-legislative-audit-advisory-commission</padig:set>
        <padig:set string="Legislative Budget and Finance Committee State Documents">95-legislative-budget-and-finance</padig:set>
        <padig:set string="Libanon Demokrat Newspaper">194-libanon-demokrat-newspaper</padig:set>
        <padig:set string="Liquor Control Board State Documents">17-liquor-control-board-state</padig:set>
        <padig:set string="Mapleton Item Newspaper">5-mapleton-item-newspaper</padig:set>
        <padig:set string="Milk Board State Documents">18-milk-board-state-documents</padig:set>
        <padig:set string="Municipal Police Officers' Education and Training Commission State Documents">28-municipal-police-officers-education</padig:set>
        <padig:set string="Office of Administration State Documents">97-office-of-administration-state</padig:set>
        <padig:set string="Office of Attorney General State Documents">101-office-of-attorney-general</padig:set>
        <padig:set string="Office of Comptroller Operations State Documents">192-office-of-comptroller-operations</padig:set>
        <padig:set string="Office of Consumer Advocate State Documents">120-office-of-consumer-advocate</padig:set>
        <padig:set string="Office of Open Records State Documents">122-office-of-open-records</padig:set>
        <padig:set string="Office of State Inspector General State Documents">124-office-of-state-inspector</padig:set>
        <padig:set string="Office of the Budget State Documents">142-office-of-the-budget</padig:set>
        <padig:set string="Office of the Governor State Documents">121-office-of-the-governor</padig:set>
        <padig:set string="Office of the State Fire Commissioner State Documents">123-office-of-the-state</padig:set>
        <padig:set string="Office of Victim Advocate State Documents">125-office-of-victim-advocate</padig:set>
        <padig:set string="Our State Army and Navy">203-our-state-army-and</padig:set>
        <padig:set string="Patient Safety Authority State Documents">198-patient-safety-authority-state</padig:set>
        <padig:set string="Penn Family Collection">183-penn-family-collection</padig:set>
        <padig:set string="Pennsylvania Angler &amp; Boater">3-pennsylvania-angler-boater</padig:set>
        <padig:set string="Pennsylvania Bulletin">1-pennsylvania-bulletin</padig:set>
        <padig:set string="Pennsylvania Bulletin Subject Indexes">184-pennsylvania-bulletin-subject-indexes</padig:set>
        <padig:set string="Pennsylvania Defense Council News">152-pennsylvania-defense-council-news</padig:set>
        <padig:set string="Pennsylvania Emergency Management Agency State Documents">139-pennsylvania-emergency-management-agency</padig:set>
        <padig:set string="Pennsylvania Evening Post">170-pennsylvania-evening-post</padig:set>
        <padig:set string="Pennsylvania Federation of Historical Societies Documents">185-pennsylvania-federation-of-historical</padig:set>
        <padig:set string="Pennsylvania Game News">2-pennsylvania-game-news</padig:set>
        <padig:set string="Pennsylvania Gazette">160-pennsylvania-gazette</padig:set>
        <padig:set string="Pennsylvania Gazette Collection (All Titles)">162-pennsylvania-gazette-collection-all</padig:set>
        <padig:set string="Pennsylvania Gazette, and Weekly Advertiser">161-pennsylvania-gazette-and-weekly</padig:set>
        <padig:set string="Pennsylvania Higher Education Assistance Agency State Documents">200-pennsylvania-higher-education-assistance</padig:set>
        <padig:set string="Pennsylvania Housing Finance Agency State Documents">135-pennsylvania-housing-finance-agency</padig:set>
        <padig:set string="Pennsylvania Lottery State Documents">197-pennsylvania-lottery-state-documents</padig:set>
        <padig:set string="Pennsylvania Military Community Enhancement Commission State Documents">132-pennsylvania-military-community-enhancement</padig:set>
        <padig:set string="Pennsylvania Newspapers">169-pennsylvania-newspapers</padig:set>
        <padig:set string="Pennsylvania Packet Collection (All Titles)">205-pennsylvania-packet-collection-all</padig:set>
        <padig:set string="Pennsylvania Packet, and Daily Advertiser">163-pennsylvania-packet-and-daily</padig:set>
        <padig:set string="Pennsylvania Packet, and the General Advertiser">206-pennsylvania-packet-and-the</padig:set>
        <padig:set string="Pennsylvania Packet, or the General Advertiser">208-pennsylvania-packet-or-the</padig:set>
        <padig:set string="Pennsylvania Parole Board State Documents">130-pennsylvania-parole-board-state</padig:set>
        <padig:set string="Pennsylvania State Police State Documents">127-pennsylvania-state-police-state</padig:set>
        <padig:set string="Pennsylvania State System of Higher Education State Documents">137-pennsylvania-state-system-of</padig:set>
        <padig:set string="Port of Pittsburgh Commission State Documents">29-port-of-pittsburgh-commission</padig:set>
        <padig:set string="Public Employee Retirement Commission State Documents">131-public-employee-retirement-commission</padig:set>
        <padig:set string="Public Pension Management and Asset Investment Review Commission State Documents">133-public-pension-management-and</padig:set>
        <padig:set string="Public School Employees' Retirement System State Documents">134-public-school-employees-retirement</padig:set>
        <padig:set string="Public Service Commission State Documents">180-public-service-commission-state</padig:set>
        <padig:set string="Public Utility Commission State Documents">143-public-utility-commission-state</padig:set>
        <padig:set string="Rare Collections: Books and Pamphlets">167-rare-collections-books-and</padig:set>
        <padig:set string="Rare Collections: Broadsides">168-rare-collections-broadsides</padig:set>
        <padig:set string="Rare Collections: Manuscripts">179-rare-collections-manuscripts</padig:set>
        <padig:set string="Rare Collections: Maps">166-rare-collections-maps</padig:set>
        <padig:set string="Securities Commission State Documents">147-securities-commission-state-documents</padig:set>
        <padig:set string="State Civil Service Commission State Documents">31-state-civil-service-commission</padig:set>
        <padig:set string="State Conservation Commission State Documents">128-state-conservation-commission-state</padig:set>
        <padig:set string="State Dependents' Commission State Documents">182-state-dependents-commission-state</padig:set>
        <padig:set string="State Employees' Retirement System State Documents">199-state-employees-retirement-system</padig:set>
        <padig:set string="State Ethics Commission State Documents">144-state-ethics-commission-state</padig:set>
        <padig:set string="State Horse Racing Commission State Documents">138-state-horse-racing-commission</padig:set>
        <padig:set string="State Law Enforcement Citizen Advisory Commission State Documents">32-state-law-enforcement-citizen</padig:set>
        <padig:set string="State Quarantine Board State Documents">190-state-quarantine-board-state</padig:set>
        <padig:set string="Susquehanna River Basin Commission State Documents">126-susquehanna-river-basin-commission</padig:set>
        <padig:set string="The Marietta Advocate and Farmers' and Mechanics' Intelligencer">210-marietta-advocate-and-farmers</padig:set>
        <padig:set string="Three Mile Island Collection">193-three-mile-island-collection</padig:set>
        <padig:set string="Treasury Department State Documents">82-treasury-department-state-documents</padig:set>
        <padig:set string="Watch on the Rhine">191-watch-on-the-rhine</padig:set>
        <padig:set string="We the People Magazine">204-we-the-people-magazine</padig:set>

        <!-- Swarthaverford -->
        <padig:set string="Truman-Underhill Photograph Collection">SC_Truman</padig:set>
        <padig:set string="Quaker Broadsides Collection">SC_Broad</padig:set>

        <!-- TJU -->
        <padig:set string="A manual of military surgery, [Confederate States Army], 1863">publication:milsurgcsa</padig:set>
        <padig:set string="A manual of military surgery, by S.D. Gross, MD, 1861">publication:milsurgusa</padig:set>
        <padig:set string="American Red Cross Base Hospital No. 38">publication:base_hospital_no_38</padig:set>
        <padig:set string="American Red Cross base hospital no. 38 in the world war by W. M. L. Coplin.">publication:american_red_cross_base_hospital</padig:set>
        <padig:set string="Ariel">publication:ariel</padig:set>
        <padig:set string="Gemrig’s illustrated catalogue of surgical instruments, ca. 1868">publication:catalogue_of_surgical_instruments</padig:set>
        <padig:set string="Historical Addresses">publication:historical_addresses</padig:set>
        <padig:set string="Historical Photographs - Center City">publication:historical_photos</padig:set>
        <padig:set string="Historical Photographs - East Falls">publication:historical_photos_ef</padig:set>
        <padig:set string="History of the anatomy act of Pennsylvania, WS Forbes, 1898">publication:anatomy_act_of_penn</padig:set>
        <padig:set string="Jefferson Biographies">publication:jeffbiographies</padig:set>
        <padig:set string="Jefferson College of Biomedical Sciences Commencements">publication:jcbscommencement</padig:set>
        <padig:set string="Jefferson College of Health Professions and Jefferson College of Pharmacy Commencements">publication:jchpjcpcommencement</padig:set>
        <padig:set string="Jefferson College of Nursing Commencements">publication:jcncommencement</padig:set>
        <padig:set string="Jefferson College of Population Health Commencements">publication:jcphcommencement</padig:set>
        <padig:set string="Jefferson Medical College Catalogs">publication:jmc_catalogs</padig:set>
        <padig:set string="Jefferson Medical College Opening Addresses">publication:jmcopeningaddresses</padig:set>
        <padig:set string="Jefferson Medical College Records Books">publication:jmcrecordsbooks</padig:set>
        <padig:set string="Jefferson Medical College Theses">publication:jmctheses</padig:set>
        <padig:set string="Jefferson Medical College Yearbooks">publication:jmc_yearbooks</padig:set>
        <padig:set string="Jefferson Review">publication:jefferson_review</padig:set>
        <padig:set string="Jefferson Sidney Kimmel Medical College Class Day">publication:skmcclassday</padig:set>
        <padig:set string="Jefferson Sidney Kimmel Medical College Commencements">publication:skmccommencement</padig:set>
        <padig:set string="John Plimpton Green Letters">publication:jpgreenletters</padig:set>
        <padig:set string="Lecture &amp; Matriculation Tickets">publication:lecturetickets</padig:set>
        <padig:set string="Manuscripts and Journals">publication:manuscripts_journals</padig:set>
        <padig:set string="Medical Notebooks">publication:medicalnotebooks</padig:set>
        <padig:set string="Modern Surgery, 4th edition, by John Chalmers Da Costa">publication:dacosta_modernsurgery</padig:set>
        <padig:set string="Nursing Alumni Bulletins">publication:nursing_alumni_bulletin</padig:set>
        <padig:set string="Obstetrics: The Science and The Art, by Charles D. Meigs, M.D.">publication:meigsobstetrics</padig:set>
        <padig:set string="On the anatomy of the breast, by Sir Astley Paston Cooper, 1840">publication:cooper</padig:set>
        <padig:set string="Textile Printing Blocks">publication:textileprintingblocks</padig:set>
        <padig:set string="The Throat and the Voice, by J. Solis Cohen, M.D. 1879">publication:throat_and_voice</padig:set>
        <padig:set string="Thomas Jefferson University, Department of Medicine, Photo Album: 1959-1975">publication:tju_dmed_photo_album</padig:set>

        <!-- University of Pittsburgh -->
        <padig:set string="19th Century Schoolbooks">pitt_collection.120</padig:set>
        <padig:set string="Abner Shimony Papers">pitt_collection.121</padig:set>
        <padig:set string="Alberto Britos Scrapbook on Nicolás Guillén Visit to Uruguay">pitt_collection.378</padig:set>
        <padig:set string="Allegheny County Medical Society Minute Book">pitt_collection.430</padig:set>
        <padig:set string="Allen Family Papers">pitt_collection.122</padig:set>
        <padig:set string="An Attempt to Describe the Future of the United States">pitt_collection.245</padig:set>
        <padig:set string="Ann P. Sharples diary">pitt_collection.435</padig:set>
        <padig:set string="Archives of Scientific Philosophy">pitt_collection.123</padig:set>
        <padig:set string="Arlen Specter Senatorial Papers">pitt_collection.288</padig:set>
        <padig:set string="Audubon's Birds of America">pitt_collection.1</padig:set>
        <padig:set string="Autograph Files of H. Edmund Friesell">pitt_collection.169</padig:set>
        <padig:set string="Barry Rosensteel Japanese Print Collection">pitt_collection.124</padig:set>
        <padig:set string="Being Human Podcast Recordings">pitt_collection.389</padig:set>
        <padig:set string="Brashear Association Records">pitt_collection.402</padig:set>
        <padig:set string="Bruno De Finetti Papers">pitt_collection.125</padig:set>
        <padig:set string="Burd-Shippen Family Papers">pitt_collection.115</padig:set>
        <padig:set string="Byrd R. Brown Autograph Album">pitt_collection.434</padig:set>
        <padig:set string="Carl Gustav Hempel Papers">pitt_collection.126</padig:set>
        <padig:set string="Charles and Frankie Pace Collection">pitt_collection.383</padig:set>
        <padig:set string="Charles J. Dengler Jr. Diary">pitt_collection.427</padig:set>
        <padig:set string="Chartres: Cathedral of Notre-Dame">pitt_collection.127</padig:set>
        <padig:set string="China's Cultural Revolution in Memories: The CR/10 Project">pitt_collection.302</padig:set>
        <padig:set string="Chinese Land Records">pitt_collection.179</padig:set>
        <padig:set string="Chinese Marriage Documents">pitt_collection.196</padig:set>
        <padig:set string="Chinese Overseas Student Newsletters">pitt_collection.244</padig:set>
        <padig:set string="Chinese Political Prisoner Photograph Collection">pitt_collection.251</padig:set>
        <padig:set string="Dialogues in Afrolatinidad">pitt_collection.368</padig:set>
        <padig:set string="Diary of an unidentified Irish Roman Catholic priest">pitt_collection.438</padig:set>
        <padig:set string="Dick Thornburgh Papers">pitt_collection.143</padig:set>
        <padig:set string="Dillon and Fetterman Families Papers">pitt_collection.428</padig:set>
        <padig:set string="Duquesne Light Photograph Collection">pitt_collection.396</padig:set>
        <padig:set string="Edna M. Parkins Berg and Carl Berg Papers">pitt_collection.437</padig:set>
        <padig:set string="Edward Rocco (E.R.) Montagna Diary">pitt_collection.433</padig:set>
        <padig:set string="Emergency Influenza Hospital Nurses (Duquesne, Pa.) Photographs">pitt_collection.405</padig:set>
        <padig:set string="Emerging Masters Collection">pitt_collection.306</padig:set>
        <padig:set string="Erroll Garner Archive">pitt_collection.340</padig:set>
        <padig:set string="Ethnic Fraternal Organizations Oral History Project Collection">pitt_collection.412</padig:set>
        <padig:set string="Fidelis Zitterbart Manuscripts">pitt_collection.190</padig:set>
        <padig:set string="Fox Chapel Garden Club Records">pitt_collection.360</padig:set>
        <padig:set string="Frances Hesselbein Papers">pitt_collection.367</padig:set>
        <padig:set string="Frank Floyd Hightower Photograph Collection">pitt_collection.422</padig:set>
        <padig:set string="Frank Plumpton Ramsey Papers">pitt_collection.128</padig:set>
        <padig:set string="Frank Russell Hightower Photograph Collection">pitt_collection.432</padig:set>
        <padig:set string="Fred Wright Cartoons">pitt_collection.112</padig:set>
        <padig:set string="Frederick J. Osterling Collection">pitt_collection.401</padig:set>
        <padig:set string="Gao Lecture Series">pitt_collection.327</padig:set>
        <padig:set string="George A. Romero Archival Collection">pitt_collection.425</padig:set>
        <padig:set string="George Washington Collection">pitt_collection.183</padig:set>
        <padig:set string="Hans Reichenbach Papers">pitt_collection.177</padig:set>
        <padig:set string="Henry F. and Kate B. Hebley Collection of Soviet Lantern Slides">pitt_collection.335</padig:set>
        <padig:set string="Herman Mishkin Photograph Collection">pitt_collection.393</padig:set>
        <padig:set string="Hervey Allen Papers">pitt_collection.129</padig:set>
        <padig:set string="Homestead Album Oral History Project Records">pitt_collection.409</padig:set>
        <padig:set string="Issac Meason Ledger and Mount Vernon Furnace Records">pitt_collection.369</padig:set>
        <padig:set string="James Wilkinson Papers">pitt_collection.116</padig:set>
        <padig:set string="Kōgyo: The Art of Noh">pitt_collection.130</padig:set>
        <padig:set string="Kuntu Repertory Theatre Records">pitt_collection.399</padig:set>
        <padig:set string="Latin American Postcard Collection">pitt_collection.400</padig:set>
        <padig:set string="Lillian A. Friedberg Postcards">pitt_collection.223</padig:set>
        <padig:set string="Mirskey Collection of Salon Orchestra and Silent Film Music">pitt_collection.370</padig:set>
        <padig:set string="Oscar Knight Diaries">pitt_collection.394</padig:set>
        <padig:set string="Pittsburgh Public Theater Collection">pitt_collection.420</padig:set>
        <padig:set string="Pittsburgh Renaissance Project: The Stanton Belfour Oral History Collection">pitt_collection.410</padig:set>
        <padig:set string="Pittsburgh Youth Olympiad Photographs">pitt_collection.403</padig:set>
        <padig:set string="Ramón Gómez de la Serna Papers">pitt_collection.132</padig:set>
        <padig:set string="Rare Books and Imprints">pitt_collection.298</padig:set>
        <padig:set string="Richard C. Jeffrey Papers">pitt_collection.133</padig:set>
        <padig:set string="Rose Rand Papers">pitt_collection.134</padig:set>
        <padig:set string="Rudolf Carnap Papers">pitt_collection.135</padig:set>
        <padig:set string="Sam Rivers Archive">pitt_collection.407</padig:set>
        <padig:set string="Sarah Cordelia Mellon and Alan Magee Scaife Wedding Album">pitt_collection.395</padig:set>
        <padig:set string="Shooting Star Review">pitt_collection.299</padig:set>
        <padig:set string="Southern Blacks' Migration to Pittsburgh Oral History Project">pitt_collection.411</padig:set>
        <padig:set string="Stalinka: Digital Library of Staliniana">pitt_collection.136</padig:set>
        <padig:set string="State and Local Government Archives Oral History Collection">pitt_collection.408</padig:set>
        <padig:set string="Steel Process Lantern Slide Collection">pitt_collection.200</padig:set>
        <padig:set string="Stockton Family Letters">pitt_collection.118</padig:set>
        <padig:set string="Thaddeus Sheldon Papers">pitt_collection.113</padig:set>
        <padig:set string="Theodore M. Finney Music Library Collection">pitt_collection.295</padig:set>
        <padig:set string="Thomas G. Masaryk Papers">pitt_collection.319</padig:set>
        <padig:set string="Travel Diary by &quot;Betty&quot;">pitt_collection.436</padig:set>
        <padig:set string="University of Pittsburgh Board of Trustees Public Meeting Minutes">pitt_collection.282</padig:set>
        <padig:set string="University of Pittsburgh Press Digital Editions">pitt_collection.137</padig:set>
        <padig:set string="V.F. Wachsmuth Treatise">pitt_collection.256</padig:set>
        <padig:set string="Vézelay: Benedictine Abbey of Sainte Marie Madeleine">pitt_collection.138</padig:set>
        <padig:set string="VIDEOSCOPE Magazine">pitt_collection.392</padig:set>
        <padig:set string="Visuals for Foreign Language Instruction">pitt_collection.139</padig:set>
        <padig:set string="Walter and Martha Leuba Papers">pitt_collection.140</padig:set>
        <padig:set string="Wesley C. Salmon Papers">pitt_collection.141</padig:set>
        <padig:set string="Wilfrid S. Sellars Papers">pitt_collection.142</padig:set>
        <padig:set string="William and James Scull Survey Ledgers">pitt_collection.259</padig:set>
        <padig:set string="Woman's Suffrage Movement in Pennsylvania Collection">pitt_collection.431</padig:set>

        <!-- University of Scranton -->
        <padig:set string="Abe L. Plotkin Collection">p9000coll4</padig:set>
        <padig:set string="George F. Davis Penmanship Collection">p16214coll1</padig:set>
        <padig:set string="International Correspondence Schools of Scranton Collection">ics</padig:set>
        <padig:set string="Medieval Manuscripts Collection">medieval</padig:set>
        <padig:set string="P. W. Costello and Family Art Collection">costello</padig:set>
        <padig:set string="Passionist Historical Archives Collection">passionists</padig:set>
        <padig:set string="Scranton Local History Collection">p9000coll6</padig:set>
        <padig:set string="University of Scranton Aquinas">aquinas</padig:set>
        <padig:set string="University of Scranton Basketball Collection">basketball</padig:set>
        <padig:set string="University of Scranton Commencement Programs">commencement</padig:set>
        <padig:set string="University of Scranton Course Catalogs">p15111coll4</padig:set>
        <padig:set string="University of Scranton Department Publications">publications</padig:set>
        <padig:set string="University of Scranton Football Collection">p15111coll2</padig:set>
        <padig:set string="University of Scranton Photos and Documents">p9000coll7</padig:set>
        <padig:set string="University of Scranton PR Publications and Press Releases">prpubs</padig:set>
        <padig:set string="University of Scranton Student Scholarship">scholarship</padig:set>
        <padig:set string="University of Scranton Yearbooks">SCRYB03</padig:set>
        <padig:set string="Zaner-Bloser, Inc. / Sonya Bloser Monroe Penmanship Collection">zanerbloser</padig:set>

        <!-- Ursinus -->
        <padig:set string="The Dutchman / The Pennsylvania Dutchman Magazine">publication:dutchmanmag</padig:set>
        <padig:set string="Pennsylvania Folklife Magazine">publication:pafolklifemag</padig:set>
        <padig:set string="Pennsylvania Folklife Magazine Indexes">publication:pafolklifemagindex</padig:set>
        <padig:set string="Providence Independent Newspaper, 1875-1898">publication:providence</padig:set>
        <padig:set string="Yost History of Ursinus College">publication:yosthistory</padig:set>
        <padig:set string="Ursinus College Fraktur Collection">publication:ursinus_fraktur</padig:set>

        <!-- Westchester -->
        <padig:set string="West Chester Doll Collection">wcudoll</padig:set>
        <padig:set string="West Chester University Anthony Wayne Letters">diaries</padig:set>
        <padig:set string="West Chester University Aralia Press">qwcaralia</padig:set>
        <padig:set string="West Chester University Archaeology Prehistoric Artifacts">qwcarch</padig:set>
        <padig:set string="West Chester University Archives">wcutreasure</padig:set>
        <padig:set string="West Chester University Chester County Business">chester</padig:set>
        <padig:set string="West Chester University Civil War">qwccivilwar</padig:set>
        <padig:set string="West Chester University Lowell Gardenour United States Air Force Asia Collection">p17189coll4</padig:set>
        <padig:set string="West Chester University Philips Autographed Library">philips</padig:set>
        <padig:set string="West Chester University Photographs">qwcphoto</padig:set>
        <padig:set string="West Chester University Postcards">qwcpost</padig:set>
        <padig:set string="West Chester University Redware">redware</padig:set>
        <padig:set string="West Chester University Sharples">sharples</padig:set>
        <padig:set string="West Chester University Student Newspapers">wcnp01</padig:set>
        <padig:set string="West Chester University World War II Collection">p17189coll1</padig:set>
        <padig:set string="West Chester University WPA Collection">wpa</padig:set>

        <!-- Widener -->
        <padig:set string="Alumni -- War Experiences">p16069coll17</padig:set>
        <padig:set string="Alumni Directories -- 1856-1991">p16069coll12</padig:set>
        <padig:set string="Alumni Magazines - Impact -- 1968-1989">p16069coll5</padig:set>
        <padig:set string="Brandywine College">p16069coll27</padig:set>
        <padig:set string="Course Catalogs - PMC Colleges -- 1967-1972">p16069coll22</padig:set>
        <padig:set string="Course Catalogs - Widener College -- 1972-1980">p16069coll23</padig:set>
        <padig:set string="Course Catalogs - Widener University - Graduate -- 1979-Present">p16069coll26</padig:set>
        <padig:set string="Course Catalogs - Widener University - Undergraduate -- 1979-Present">p16069coll24</padig:set>
        <padig:set string="Intersections - Sexuality and University Archives Together">p16069coll34</padig:set>
        <padig:set string="Newspapers -- 1877-1912">p16069coll19</padig:set>
        <padig:set string="Student Handbooks -- 1947-Present">p16069coll31</padig:set>
        <padig:set string="View Books">p16069coll32</padig:set>
        <padig:set string="Widener Online Newsletters">p16069coll20</padig:set>
        <padig:set string="Alumni Magazines - Alumni Bulletin and Alumnus -- 1952-1968">p16069coll3</padig:set>
        <padig:set string="Alumni Magazines - Widener Magazine -- 1989-Present">p16069coll6</padig:set>
        <padig:set string="Buildings">p16069coll1</padig:set>
        <padig:set string="Caps and Uniforms">p270801coll5</padig:set>
        <padig:set string="Course Catalogs  - Circulars -- 1856-1892">p16069coll11</padig:set>
        <padig:set string="Course Catalogs - Pennsylvania Military College -- 1893-1966">p16069coll21</padig:set>
        <padig:set string="Cowee Family Papers">p16069coll14</padig:set>
        <padig:set string="Distinguished Alumni">p270801coll17</padig:set>
        <padig:set string="Diversity Trailblazers">p16069coll33</padig:set>
        <padig:set string="Fallen Soldiers - PMC and Widener Alumni Who Died in Combat">p16069coll35</padig:set>
        <padig:set string="Female Trailblazers">p16069coll28</padig:set>
        <padig:set string="Historical Chronologies">p270801coll10</padig:set>
        <padig:set string="Histories - A History of Pennsylvania Military College -- 1821-1954">p270801coll8</padig:set>
        <padig:set string="Histories - Faculty, Administration and Alumni Oral Histories">p16069coll8</padig:set>
        <padig:set string="Histories - Pennsylvania Military College -- The Story of One Hundred Years">p16069coll7</padig:set>
        <padig:set string="Libraries - From Old Main to Wolfgram">p16069coll29</padig:set>
        <padig:set string="Newspapers - The Dome -- 1947-2008">p270801coll11</padig:set>
        <padig:set string="Newspapers - The PMC News -- 1916-1950">p16069coll9</padig:set>
        <padig:set string="Pennsylvania Military Preparatory School (PMPS)">p16069coll15</padig:set>
        <padig:set string="Photographs - PMA and PMC">p15139coll2</padig:set>
        <padig:set string="PMC 50th Anniversary Exhibits and Homecoming Videos">p16069coll30</padig:set>
        <padig:set string="PMC During World War II">p16069coll4</padig:set>
        <padig:set string="Postcards">p270801coll15</padig:set>
        <padig:set string="Presidents on Parade">p16069coll25</padig:set>
        <padig:set string="Scrapbooks">p270801coll4</padig:set>
        <padig:set string="Seals and Emblems">p16069coll13</padig:set>
        <padig:set string="Student Lists 1856-1930">p16069coll10</padig:set>
        <padig:set string="Taps Lyrics - History">p16069coll36</padig:set>
        <padig:set string="Yearbooks - Pennsylvania Military College and PMC Colleges -- 1900 - 1972">p270801coll6</padig:set>
        <padig:set string="Yearbooks- Widener College and Widener University --  1973 - 2010">p15139coll3</padig:set>
    </xsl:param>

    <!-- PA State Archives collection name lookup -->
    <xsl:param name="psaSetSpecList">
        <padig:set string="Land Office">1</padig:set>
        <padig:set string="Pennsylvania Historical and Museum Commission">2</padig:set>
        <padig:set string="Military and Veterans' Affairs, Department of">3</padig:set>
        <padig:set string="Postcard Collection, ca. 1880-1974">4</padig:set>
        <padig:set string="Poster Collection, 1854-present, undated">5</padig:set>
        <padig:set string="Records of the Board of Canal Commissioners">6</padig:set>
        <padig:set string="Bureau of the State Archives">7</padig:set>
        <padig:set string="Civil War Veterans Card File 1861-1866">8</padig:set>
        <padig:set string="World War I Service Medal Application Cards circa 1938-1950">12</padig:set>
        <padig:set string="Spanish American War Veterans Card File of United States Volunteers undated">13</padig:set>
        <padig:set string="Mexican Border Campaign Veterans Card File 1916-1917">14</padig:set>
        <padig:set string="Veterans Card File 1867-1919">15</padig:set>
        <padig:set string="County File undated">16</padig:set>
        <padig:set string="Subject File undated">17</padig:set>
        <padig:set string="Business and Advertising File undated">18</padig:set>
        <padig:set string="Clyde Laughlin Real Photo Postcards">19</padig:set>
        <padig:set string="Miscellaneous">20</padig:set>
        <padig:set string="Posters 1829, 1851, 1854-1971, 1981-1987, undated">21</padig:set>
        <padig:set string="Map Books, 1810-1881, undated">22</padig:set>
        <padig:set string="Revolutionary War Military Abstract Card File 1785-1893">23</padig:set>
        <padig:set string="Militia Officers Index Cards 1775-1800">24</padig:set>
        <padig:set string="Adams County Postcards">25</padig:set>
        <padig:set string="Allegheny County Postcards">26</padig:set>
        <padig:set string="Armstrong County Postcards">27</padig:set>
        <padig:set string="Beaver County Postcards">28</padig:set>
        <padig:set string="Bedford County Postcards">29</padig:set>
        <padig:set string="Berks County Postcards">30</padig:set>
        <padig:set string="Blair County Postcards">31</padig:set>
        <padig:set string="Bradford County Postcards">32</padig:set>
        <padig:set string="Bucks County Postcards">33</padig:set>
        <padig:set string="Butler County Postcards">34</padig:set>
        <padig:set string="Cambria County Postcards">35</padig:set>
        <padig:set string="Cameron County Postcards">36</padig:set>
        <padig:set string="Carbon County Postcards">37</padig:set>
        <padig:set string="Centre County Postcards">38</padig:set>
        <padig:set string="Chester County Postcards">39</padig:set>
        <padig:set string="Clarion County Postcards">40</padig:set>
        <padig:set string="Clearfield County Postcards">41</padig:set>
        <padig:set string="Clinton County Postcards">42</padig:set>
        <padig:set string="Columbia County Postcards">43</padig:set>
        <padig:set string="Crawford County Postcards">44</padig:set>
        <padig:set string="Cumberland County Postcards">45</padig:set>
        <padig:set string="Dauphin County Postcards">46</padig:set>
        <padig:set string="Delaware County Postcards">47</padig:set>
        <padig:set string="Elk County Postcards">48</padig:set>
        <padig:set string="Erie County Postcards">49</padig:set>
        <padig:set string="Fayette County Postcards">50</padig:set>
        <padig:set string="Forest County Postcards">51</padig:set>
        <padig:set string="Franklin County Postcards">52</padig:set>
        <padig:set string="Fulton County Postcards">53</padig:set>
        <padig:set string="Greene County Postcards">54</padig:set>
        <padig:set string="Huntingdon County Postcards">55</padig:set>
        <padig:set string="Indiana County Postcards">56</padig:set>
        <padig:set string="Jefferson County Postcards">57</padig:set>
        <padig:set string="Juniata County Postcards">58</padig:set>
        <padig:set string="Lackawanna County Postcards">59</padig:set>
        <padig:set string="Lancaster County Postcards">60</padig:set>
        <padig:set string="Lawrence County Postcards">61</padig:set>
        <padig:set string="Lebanon County Postcards">62</padig:set>
        <padig:set string="Lehigh County Postcards">63</padig:set>
        <padig:set string="Luzerne County Postcards">64</padig:set>
        <padig:set string="Lycoming County Postcards">65</padig:set>
        <padig:set string="McKean County Postcards">66</padig:set>
        <padig:set string="Mercer County Postcards">67</padig:set>
        <padig:set string="Mifflin County Postcards">68</padig:set>
        <padig:set string="Monroe County Postcards">69</padig:set>
        <padig:set string="Montgomery County Postcards">70</padig:set>
        <padig:set string="Montour County Postcards">71</padig:set>
        <padig:set string="Northampton County Postcards">72</padig:set>
        <padig:set string="Northumberland County Postcards">73</padig:set>
        <padig:set string="Perry County Postcards">74</padig:set>
        <padig:set string="Philadelphia County Postcards">75</padig:set>
        <padig:set string="Pike County Postcards">76</padig:set>
        <padig:set string="Potter County Postcards">77</padig:set>
        <padig:set string="Schuylkill County Postcards">78</padig:set>
        <padig:set string="Snyder County Postcards">79</padig:set>
        <padig:set string="Somerset County Postcards">80</padig:set>
        <padig:set string="Sullivan County Postcards">81</padig:set>
        <padig:set string="Susquehanna County Postcards">82</padig:set>
        <padig:set string="Tioga County Postcards">83</padig:set>
        <padig:set string="Union County Postcards">84</padig:set>
        <padig:set string="Venango County Postcards">85</padig:set>
        <padig:set string="Warren County Postcards">86</padig:set>
        <padig:set string="Washington County Postcards">87</padig:set>
        <padig:set string="Wayne County Postcards">88</padig:set>
        <padig:set string="Westmoreland County Postcards">89</padig:set>
        <padig:set string="Wyoming County Postcards">90</padig:set>
        <padig:set string="York County Postcards">91</padig:set>
        <padig:set string="Civil War (pre and post to 1910)">92</padig:set>
        <padig:set string="Fire Prevention">93</padig:set>
        <padig:set string="Miscellaneous">94</padig:set>
        <padig:set string="World War 1">95</padig:set>
        <padig:set string="World War 2">96</padig:set>
        <padig:set string="Agriculture, Department of">97</padig:set>
        <padig:set string="Auditor General, Department of the">98</padig:set>
        <padig:set string="Comptroller General, Office of the">99</padig:set>
        <padig:set string="Education, Department of">100</padig:set>
        <padig:set string="Environmental Protection, Department of (DEP)">101</padig:set>
        <padig:set string="Environmental Resources, Department of">102</padig:set>
        <padig:set string="General Assembly">103</padig:set>
        <padig:set string="Health, Department of">104</padig:set>
        <padig:set string="Justice, Department of">105</padig:set>
        <padig:set string="Mines and Mineral Industries, Department of">106</padig:set>
        <padig:set string="Navigation Commission for the Delaware River and its Navigable Tributaries">107</padig:set>
        <padig:set string="Pennsylvania State Police">108</padig:set>
        <padig:set string="Pennsylvania's Revolutionary Governments">109</padig:set>
        <padig:set string="Proprietary Government">110</padig:set>
        <padig:set string="State, Department of">111</padig:set>
        <padig:set string="Supreme Court of Pennsylvania">112</padig:set>
        <padig:set string="Farm Census Returns, 1924, 1927">113</padig:set>
        <padig:set string="Mexican War Accounts and Related Papers, 1846-1880">114</padig:set>
        <padig:set string="Military Pension Accounts and Related Papers, circa 1789-1883">115</padig:set>
        <padig:set string="Revolutionary War Pension File, 1809-1893">116</padig:set>
        <padig:set string="War of 1812 Militia Accounts, 1812-1827">117</padig:set>
        <padig:set string="War of 1812 Militia Accounts: Final Settlement with the United States, 1812-1827">118</padig:set>
        <padig:set string="Depreciation Certificate Accounts, 1781-1792">119</padig:set>
        <padig:set string="Forfeited Estate Accounts, 1777-1809">120</padig:set>
        <padig:set string="Militia Loan Accounts, 1781-1792">121</padig:set>
        <padig:set string="Philadelphia City General Muster Roll Books, 1777-1784">122</padig:set>
        <padig:set string="Philadelphia City Lieutenant's Office General Return Book of Militia Called into Actual Service, 1777-1782">123</padig:set>
        <padig:set string="Pierce's Certificate Accounts, Pay Roll Books Voucher Indexes Ownership Certificates and an Account of Certificates Loaned to the United States, 1778-1793">124</padig:set>
        <padig:set string="Revolutionary War Accounts and Miscellaneous Records (Associators Accounts), 1775-1777">125</padig:set>
        <padig:set string="Revolutionary War Accounts and Miscellaneous Records (Line Accounts), 1775-1809">126</padig:set>
        <padig:set string="Revolutionary War Accounts and Miscellaneous Records (Militia 3A Accounts), 1777-1794">127</padig:set>
        <padig:set string="Revolutionary War Accounts and Miscellaneous Records (Militia 3B Accounts), 1793-1809">128</padig:set>
        <padig:set string="Revolutionary War Accounts and Miscellaneous Records (Navy Accounts), 1775-1794">129</padig:set>
        <padig:set string="Revolutionary War Pension Files And Related Accounts, 1785-1809">130</padig:set>
        <padig:set string="Applications for Teaching Certificates, 1866-1922">131</padig:set>
        <padig:set string="Record of Dental Licenses, 1897-1923">132</padig:set>
        <padig:set string="Record of Dental Licenses, 1923-1965">133</padig:set>
        <padig:set string="Record of Medical Licenses, 1912-1964">134</padig:set>
        <padig:set string="Record Books of Permanent Teaching Certificates, 1868-1908">135</padig:set>
        <padig:set string="Register of Physicians, 1870-1917">136</padig:set>
        <padig:set string="Anthracite Mine Certification Records for Foremen and Assistant Foremen, 1886-1968">137</padig:set>
        <padig:set string="Index Stubs and Cards to Miners' Certificates, 1937-1988">138</padig:set>
        <padig:set string="Anthracite and Bituminous Fatal Mining Accident Reports, 1936-1974">139</padig:set>
        <padig:set string="Minute Books, 1779-1781, 1783-1784, 1788">140</padig:set>
        <padig:set string="Petitions and Miscellaneous Records, 1776-1789, undated">141</padig:set>
        <padig:set string="Cadaver Receiving Books, 1901-1965">142</padig:set>
        <padig:set string="Eastern State Penitentiary">143</padig:set>
        <padig:set string="Western State Penitentiary">144</padig:set>
        <padig:set string="Board of Pardons">145</padig:set>
        <padig:set string="State Correctional Institution, Huntingdon">146</padig:set>
        <padig:set string="State Correctional Institution, Graterford">147</padig:set>
        <padig:set string="Bituminous Mine Certification Records for Assistant First and Second Grade Foremen, 1923-1963">148</padig:set>
        <padig:set string="Bituminous Mine Certification Records for Assistant Foremen, 1911-1923">149</padig:set>
        <padig:set string="Bituminous Mine Certification Records for Electricians, 1939-1963">150</padig:set>
        <padig:set string="Bituminous Mine Certification Records for Fire Boss Examiners, 1912-1963">151</padig:set>
        <padig:set string="Bituminous Mine Certification Records for First Grade Foremen, 1903-1963">152</padig:set>
        <padig:set string="Bituminous Mine Certification Records for Second Grade Foremen, 1903-1963">153</padig:set>
        <padig:set string="Registers of Mine Accidents for the Anthracite Districts, 1899-1972">154</padig:set>
        <padig:set string="Registers of Mine Accidents for the Bituminous Districts, 1899-1972">155</padig:set>
        <padig:set string="Health Officer's Register of Passengers' Names, 1792-1794">156</padig:set>
        <padig:set string="Ku Klux Klan General Accounts, 1925-1940">157</padig:set>
        <padig:set string="Ku Klux Klan General Correspondence, 1922-1929, 1932, 1934-1940">158</padig:set>
        <padig:set string="Ku Klux Klan General Files, 1923-1940">159</padig:set>
        <padig:set string="Ku Klux Klan Kleagle Robe Reports, 1924-1925">160</padig:set>
        <padig:set string="Descriptive Books of Troopers, 1906-1939">161</padig:set>
        <padig:set string="Strike Reports, 1936-1941">162</padig:set>
        <padig:set string="Troop Reports, 1906-1930">163</padig:set>
        <padig:set string="Committee of Safety 1775-1776">164</padig:set>
        <padig:set string="Provincial Convention 1776">165</padig:set>
        <padig:set string="Council of Safety 1776-1777">166</padig:set>
        <padig:set string="Second Council of Safety 1777">167</padig:set>
        <padig:set string="Supreme Executive Council 1777-1790">168</padig:set>
        <padig:set string="Board of War 1777">169</padig:set>
        <padig:set string="Navy Board 1777">170</padig:set>
        <padig:set string="Commissioners of Indian Trade Accounts, 1758-1766">171</padig:set>
        <padig:set string="Crown Correspondence, 1726-1775">172</padig:set>
        <padig:set string="Executive Correspondence, 1682-1775">173</padig:set>
        <padig:set string="General Correspondence, 1700-1772">174</padig:set>
        <padig:set string="Governor's Accounts including Lists of Marriage, Tavern, Peddlers Licenses and Ships' Registers, 1742-1752, 1759-1763">175</padig:set>
        <padig:set string="Indian Trader Licenses, 1765-1771">176</padig:set>
        <padig:set string="Minutes (The Provincial Record), 1682-1775">177</padig:set>
        <padig:set string="Miscellaneous Papers, 1664-1863">178</padig:set>
        <padig:set string="Naturalization Lists of the Supreme Court and Courts of Nisi Prius, 1740-1773">179</padig:set>
        <padig:set string="Appointment and Commission Books for Civil Officers, 1790-1823">180</padig:set>
        <padig:set string="Appointments File for Civil Officers, 1790-1808">181</padig:set>
        <padig:set string="Charter Books, 1812-1875">182</padig:set>
        <padig:set string="Clemency File 1790-1873">183</padig:set>
        <padig:set string="Commission Books, 1775-1842">184</padig:set>
        <padig:set string="Death Warrants File, 1795-1873">185</padig:set>
        <padig:set string="Exam Scores for Medical Doctors, 1894-1927">186</padig:set>
        <padig:set string="Executive Correspondence, 1790-1969">187</padig:set>
        <padig:set string="Governor's Minutes, 1838-1959">188</padig:set>
        <padig:set string="Governor's Proclamations, 1791-1995">189</padig:set>
        <padig:set string="Index of Licensed Practitioners of Medicine in Pennsylvania, 1894-1981">190</padig:set>
        <padig:set string="American Indian Deed Book, 1815">191</padig:set>
        <padig:set string="Letters Patent, 1814-1879, 1902-1927">192</padig:set>
        <padig:set string="Military Commission Books Card Index, 1800-1860">193</padig:set>
        <padig:set string="Military Commission Books, 1800-1944">194</padig:set>
        <padig:set string="Pardon Books, 1791-1877">195</padig:set>
        <padig:set string="Ships Lists of German Passengers, 1727-1808">196</padig:set>
        <padig:set string="Eastern District">197</padig:set>
        <padig:set string="Middle District">198</padig:set>
        <padig:set string="Western District">199</padig:set>
        <padig:set string="Courts of Oyer and Terminer and Gaol Delivery">200</padig:set>
        <padig:set string="Civil War Muster Rolls and Related Records, 1861-1866">201</padig:set>
        <padig:set string="Annual Reports of the Commission of Soldiers' Orphan Schools and the Superintendent of the Soldiers' Orphan School Department, 1870-1918">202</padig:set>
        <padig:set string="Conscientious Objector Depositions, 1862">203</padig:set>
        <padig:set string="Korean War Compensation Application Batch Sheets and Serial Number Indexes, 1955-1967">204</padig:set>
        <padig:set string="Lists of Deserters and Substitute Deserters, 1861-1866">205</padig:set>
        <padig:set string="Lists of Sick and Wounded Soldiers, Pennsylvania Volunteers, 1861-1864">206</padig:set>
        <padig:set string="Mexican War Service Index, 1846-1848">207</padig:set>
        <padig:set string="Records of Drafted Men &amp; Substitutes, Inc: County and Township Draft Lists, Muster &amp; Descriptive Rolls, Lists of Deserters &amp; Conscientious Objectors, circa 1862">208</padig:set>
        <padig:set string="Register of Sick and Wounded Soldiers, circa 1861-1865">209</padig:set>
        <padig:set string="Substitutes' Depositions, 1862">210</padig:set>
        <padig:set string="Pennsylvania Historical Commission (1913-1945)">211</padig:set>
        <padig:set string="County Records Alphabetical Inventory, 1984">212</padig:set>
        <padig:set string="County Records Inventory by Office, 1984">213</padig:set>
        <padig:set string="Commutation and Parole Books, 1907-1932">214</padig:set>
        <padig:set string="Death Warrants File, 1874-1899">215</padig:set>
        <padig:set string="Pardon Books, 1874-1934">216</padig:set>
        <padig:set string="Parole and Respite Books, 1910-1942">217</padig:set>
        <padig:set string="Record Books of Capital Cases, 1894-1969">218</padig:set>
        <padig:set string="Admission and Discharge Books, 1844-1888">219</padig:set>
        <padig:set string="Commitment Papers, 1841, 1861-1904">220</padig:set>
        <padig:set string="Commutation Books, 1865-1918">221</padig:set>
        <padig:set string="Convict Affidavit Books, 1835-1856">222</padig:set>
        <padig:set string="Descriptive Registers, 1829-1903">223</padig:set>
        <padig:set string="Discharge Books, 1830-1858">224</padig:set>
        <padig:set string="Discharge Descriptive Dockets, 1873-1934">225</padig:set>
        <padig:set string="Letters To and From Prisoners, 1845">226</padig:set>
        <padig:set string="Miscellaneous Descriptive Books, 1829-1842">227</padig:set>
        <padig:set string="Parole Prisoners' Date of Discharge Books, 1910-1960">228</padig:set>
        <padig:set string="Population Indexes, circa 1900">229</padig:set>
        <padig:set string="Reception Descriptive Book, 1879-1884">230</padig:set>
        <padig:set string="Registers of Visitors, 1829-1854">231</padig:set>
        <padig:set string="Scrapbooks, 1884-1893, 1908-1917, 1925-1926">232</padig:set>
        <padig:set string="Statistical Books, 1835-1852, 1871-1909, 1911-1913, 1915">233</padig:set>
        <padig:set string="Time Books, 1889-1950">234</padig:set>
        <padig:set string="Warden's Daily Journals, 1829-1961">235</padig:set>
        <padig:set string="Warden's Daily Journals, 1927-1956">236</padig:set>
        <padig:set string="Prison Administration Records: Attorney General's Opinions, 1892-1893, 1896-1898">237</padig:set>
        <padig:set string="Prison Population Records: Conduct Ledgers, 1889-1894, 1896-1898, 1903-1905, 1916-1918">238</padig:set>
        <padig:set string="Prison Population Records: Physicians' Record of Prisoners, 1889-1910">239</padig:set>
        <padig:set string="Prison Population Records: Prisoners' Record, 1889-1929">240</padig:set>
        <padig:set string="Prison Population Records: Record of Maximum Sentences, 1915-1918">241</padig:set>
        <padig:set string="Prison Population Records: Record of Men Paroled and Related Materials, 1890-1894, 1909-1913">242</padig:set>
        <padig:set string="Prison Population Records: Record of Special Punishments, 1889-1925, 1931">243</padig:set>
        <padig:set string="Prison Population Records: Reformatory Record (Weekly Prison Publication), 1890-1936">244</padig:set>
        <padig:set string="Prison Population Records: Admission and Discharge Books, 1872-1906">245</padig:set>
        <padig:set string="Prison Population Records: Bertillon Registration Books, 1888-1895">246</padig:set>
        <padig:set string="Prison Population Records: Commutation Books, 1917-1958">247</padig:set>
        <padig:set string="Prison Population Records: Convict Description and Receiving Dockets, 1872-1957">248</padig:set>
        <padig:set string="Prison Population Records: Convict Docket, 1826-1859">249</padig:set>
        <padig:set string="Prison Population Records: Daily Population Statistical Reports, 1924, 1928-1929, 1940, 1960">250</padig:set>
        <padig:set string="Prison Population Records: Descriptive Books, 1826-1873">251</padig:set>
        <padig:set string="Prison Population Records: Descriptive Register, 1826-1876">252</padig:set>
        <padig:set string="Prison Population Records: Index of Prisoners, circa mid-1930s - early 1950s">253</padig:set>
        <padig:set string="Prison Population Records: Inmate Transfer Register (Discharge Ledger), 1954-1957">254</padig:set>
        <padig:set string="Prison Population Records: Paroled Prisoner Statistical Book, 1910-1931">255</padig:set>
        <padig:set string="Prison Population Records: Population Indexes, 1826-circa 1960">256</padig:set>
        <padig:set string="Prison Population Records: Discharge Description Dockets, 1873-1957">257</padig:set>
        <padig:set string="Prison Population Records: Prisoner Registers, 1910-1970">258</padig:set>
        <padig:set string="Prison Population Records: Prisoners Paroled and Discharged Book, 1887-1918">259</padig:set>
        <padig:set string="Prison Population Records: Record of County and Federal Prisoners, 1857-1870">260</padig:set>
        <padig:set string="Prison Population Records: Record of Parole Violators, 1942-1954">261</padig:set>
        <padig:set string="Prison Population Records: Time Ledger for Length of Sentences, 1917-1967">262</padig:set>
        <padig:set string="Prison Administration and Construction Records: Visitors' Register, 1848-1860">263</padig:set>
        <padig:set string="Prison Administration and Construction Records: Warden's Daily Journals, 1869-1875">264</padig:set>
        <padig:set string="Inventory of County Archives of Pennsylvania, 1937-1942, 1946, 1950">265</padig:set>
        <padig:set string="Bonds of Marque, 1777">266</padig:set>
        <padig:set string="General Correspondence and Petitions, 1777">267</padig:set>
        <padig:set string="Minute Book, 1777">268</padig:set>
        <padig:set string="Executive Correspondence and Petitions, 1775-1776, undated">269</padig:set>
        <padig:set string="Minute Book, 1775-1776">270</padig:set>
        <padig:set string="Minutes (Rough Copy), 1775-1776, undated">271</padig:set>
        <padig:set string="Executive Correspondence, 1775-1777, undated">272</padig:set>
        <padig:set string="Minute Books, 1776-1777">273</padig:set>
        <padig:set string="Minutes (Rough Copy), 1776, undated">274</padig:set>
        <padig:set string="Minute Books, 1777">275</padig:set>
        <padig:set string="Executive Correspondence, 1776">276</padig:set>
        <padig:set string="Executive Correspondence, 1777">277</padig:set>
        <padig:set string="Minute Book (Rough Copy), 1777">278</padig:set>
        <padig:set string="Minute Book, 1777">279</padig:set>
        <padig:set string="Applications for Passes, 1776-1788, undated">280</padig:set>
        <padig:set string="Appointments File, Military, 1775-1790">281</padig:set>
        <padig:set string="Appointments File, Political, 1775-1790">282</padig:set>
        <padig:set string="Clemency File, 1775-1790, undated">283</padig:set>
        <padig:set string="Election Returns, 1776-1790, undated">284</padig:set>
        <padig:set string="Executive Correspondence and Petitions, 1777-1790, undated">285</padig:set>
        <padig:set string="Forfeited Estates File, 1777-1790">286</padig:set>
        <padig:set string="Letter Books, 1782-1789">287</padig:set>
        <padig:set string="Marriage Bonds for Philadelphia County, 1784-1786">288</padig:set>
        <padig:set string="Military Returns, 1775-1790">289</padig:set>
        <padig:set string="Minute Books (Rough Copies), 1777-1790">290</padig:set>
        <padig:set string="Minute Books, 1777-1790">291</padig:set>
        <padig:set string="Oaths of Allegiance, 1777-1790">292</padig:set>
        <padig:set string="Proceedings of the American Indian Commissioners in Pennsylvania, 1784-1785">293</padig:set>
        <padig:set string="Register of Letters of Marque, 1778-1782">294</padig:set>
        <padig:set string="General Gaol Delivery Dockets, 1778-1828">295</padig:set>
        <padig:set string="Appearance and Continuance Dockets, 1740-1795">296</padig:set>
        <padig:set string="Appearance Dockets, 1795-1977">297</padig:set>
        <padig:set string="Index to Declaration of Intention Dockets, 1832-1901">298</padig:set>
        <padig:set string="Index to Naturalization Papers, 1794-1824, 1842-1868">299</padig:set>
        <padig:set string="Judgment Dockets, 1756-1896">300</padig:set>
        <padig:set string="Revolutionary War Soldiers' Claims and Related Papers, 1786-1789">301</padig:set>
        <padig:set string="Appearance Dockets, 1956-1977">302</padig:set>
        <padig:set string="Dockets, Including Lancaster and Chambersburg District Dockets, 1800-1961">303</padig:set>
        <padig:set string="Appeal Dockets, 1795-1941">304</padig:set>
        <padig:set string="Naturalization Docket, 1812-1867, bulk 1830-1855">305</padig:set>
        <padig:set string="Naturalization Papers, 1831, 1840-1841, 1844-1856, 1862, 1867">306</padig:set>
        <padig:set string="Certificate Counterparts, 1784-1792">37115</padig:set>
        <padig:set string="Certificate Books, 1784-1792">37288</padig:set>
        <padig:set string="Distribution Vouchers, 1784-1785">37363</padig:set>
        <padig:set string="Interest Paid Receipt Books, 1785-1792 (Called Militia Certificates, Act of March 16, 1785)">37525</padig:set>
        <padig:set string="Appeal Docket Index, 1795-1857">170507</padig:set>
        <padig:set string="State Board of Censors (Motion Picture)">266038</padig:set>
        <padig:set string="Applications for Examination, 1915-1951">266039</padig:set>
        <padig:set string="Daily Minutes, 1939-1956">266040</padig:set>
        <padig:set string="General Correspondence, 1924-1956">266041</padig:set>
        <padig:set string="Legal Briefs, 1915-1921, 1928-1932, 1940">266042</padig:set>
        <padig:set string="Reports, 1925-1951">266043</padig:set>
        <padig:set string="Rules, Procedures and Forms, 1915-1956">266044</padig:set>
        <padig:set string="Map Book Number 01, 1829-1844">279689</padig:set>
        <padig:set string="Map Book Number 02, 1836-1838">280010</padig:set>
        <padig:set string="Map Book Number 03, 1830-1841">291435</padig:set>
        <padig:set string="Map Book Number 04, 1829-1866">292825</padig:set>
        <padig:set string="Map Book Number 05, 1828">292988</padig:set>
        <padig:set string="Map Book Number 06, 1828">308686</padig:set>
        <padig:set string="Map Book Number 07, 1827-1855">308748</padig:set>
        <padig:set string="Map Book Number 08, n.d.">309019</padig:set>
        <padig:set string="Map Book Number 09, 1826">315963</padig:set>
        <padig:set string="Map Book Number 10, n.d.">316070</padig:set>
        <padig:set string="Map Book Number 11, 1839-1841">319380</padig:set>
        <padig:set string="Map Book Number 12, 1826-1827">319549</padig:set>
        <padig:set string="Map Book Number 13, 1826-1866">319665</padig:set>
        <padig:set string="Map Book Number 14, 1881, n.d.">319731</padig:set>
        <padig:set string="Map Book Number 15, n.d.">319810</padig:set>
        <padig:set string="Map Book Number 16, 1831-1855">319951</padig:set>
        <padig:set string="Map Book Number 17, n.d.">320124</padig:set>
        <padig:set string="Map Book Number 18, 1836-1846">320269</padig:set>
        <padig:set string="Map Book Number 19, 1824-1840">320422</padig:set>
        <padig:set string="Map Book Number 20, 1831-1851">320446</padig:set>
        <padig:set string="Map Book Number 21, 1826, 1839-1840">320571</padig:set>
        <padig:set string="Map Book Number 22, 1827">320987</padig:set>
        <padig:set string="Map Book Number 23, 1825-1871">321081</padig:set>
        <padig:set string="Map Book Number 24, n.d.">321138</padig:set>
        <padig:set string="Map Book Number 25, 1830-1831">321161</padig:set>
        <padig:set string="Map Book Number 26, 1827-1835">321196</padig:set>
        <padig:set string="Map Book Number 27, n.d.">321288</padig:set>
        <padig:set string="Map Book Number 28, n.d.">321356</padig:set>
        <padig:set string="Map Book Number 29, 1826-1833">321446</padig:set>
        <padig:set string="Map Book Number 30, 1836">321571</padig:set>
        <padig:set string="Map Book Number 31, 1826">321725</padig:set>
        <padig:set string="Map Book Number 32, 1840-1878">321796</padig:set>
        <padig:set string="Map Book Number 34, 1828">321831</padig:set>
        <padig:set string="Map Book Number 35, 1828">321909</padig:set>
        <padig:set string="Map Book Number 36, 1836-1838">346732</padig:set>
        <padig:set string="Map Book Number 37, 1810-1855">346743</padig:set>
        <padig:set string="Map Book Number 39, 1839, 1846, 1855">346951</padig:set>
        <padig:set string="Map Book Number 40, 1828">347005</padig:set>
        <padig:set string="Map Book Number 41, 1827">347037</padig:set>
        <padig:set string="Map Book Number 42, 1828-1857">347092</padig:set>
        <padig:set string="Map Book Number 43, 1826-1851">347153</padig:set>
        <padig:set string="Map Book Number 44, n.d.">347217</padig:set>
        <padig:set string="Map Book Number 45, 1830">347280</padig:set>
        <padig:set string="Map Book Number 46 (Title page only)">347336</padig:set>
        <padig:set string="Map Book Number 47, n.d.">347387</padig:set>
        <padig:set string="Map Book Number 48, 1827-1828">347415</padig:set>
        <padig:set string="Map Book Number 49, 1841">347468</padig:set>
        <padig:set string="Map Book Number 50, 1826-1859">347526</padig:set>
        <padig:set string="Map Book Number 51, 1841-1842">347639</padig:set>
        <padig:set string="Map Book Number 52, 1841">347683</padig:set>
        <padig:set string="Day Books, 1809-1879">371447</padig:set>
        <padig:set string="Geological Survey Accounts, 1837-1840, 1851-1857, 1875">371448</padig:set>
        <padig:set string="Military Claims File: Claims not Settled, 1862-1905">371450</padig:set>
        <padig:set string="Military Claims File: Claims Settled, 1862-1905">371451</padig:set>
        <padig:set string="Pennsylvania Military Museum Collections 1789, 1856-1994, undated">609272</padig:set>
        <padig:set string="Posters (Financial) 1917, 1918, undated">609456</padig:set>
        <padig:set string="Posters (Agriculture) 1917, undated">609678</padig:set>
        <padig:set string="Posters (Marines) 1917, undated">609776</padig:set>
        <padig:set string="Posters (Navy) 1916-1917, undated">609815</padig:set>
        <padig:set string="Posters (Red Cross) 1918, undated">609881</padig:set>
        <padig:set string="Posters (Service Organizations) undated">609974</padig:set>
        <padig:set string="Individual Collections">610031</padig:set>
        <padig:set string="Fletcher McKnight Collection">610151</padig:set>
        <padig:set string="Posters circa 1918, undated">614609</padig:set>
        <padig:set string="County Officers' Accounts, 1809-1907">782680</padig:set>
        <padig:set string="Record of Chambersburg War Damage Claim Final Awards Issued Under Act of February 15, 1866), 1866">782728</padig:set>
        <padig:set string="Minutes of the Board of Appraisers to Examine Damage to Property Along the Southern Border, 1863-1864">782820</padig:set>
        <padig:set string="Minutes of the Board of Appraisers of Chambersburg War Damages, 1866">782911</padig:set>
        <padig:set string="Chambersburg War Damage Claim Warrant Stub Books (Per Act of February 15, 1866), 1866">782963</padig:set>
        <padig:set string="Chambersburg War Damage Claim Applications (Submitted Under Act of Feb. 15, 1866), 1866-1868">783025</padig:set>
        <padig:set string="Civil War Service and Pension Accounts, 1861-1871">783238</padig:set>
        <padig:set string="Account of the United States to the State of Pennsylvania, circa 1775-1788">1114473</padig:set>
        <padig:set string="Alphabetical (Old) Index to Continental Ledgers Nos. 1 and 2, 1775-1785">1114474</padig:set>
        <padig:set string="Alphabetical List of Accounts, undated">1114475</padig:set>
        <padig:set string="Boundary Survey Accounts, 1782-1810">1114476</padig:set>
        <padig:set string="Commissary Accounts, 1775-1792">1114477</padig:set>
        <padig:set string="Commissioners of Purchases Accounts, 1780-1783">1114478</padig:set>
        <padig:set string="Continental and State Money Account Book, 1781-1784">1114479</padig:set>
        <padig:set string="Continental Day Book and Waste Book, 1775-1783">1114527</padig:set>
        <padig:set string="Continental Journals, 1775-1785">1114553</padig:set>
        <padig:set string="Continental Ledgers, circa 1775-1785">1114574</padig:set>
        <padig:set string="County Officers' Accounts, 1782-1809">1114683</padig:set>
        <padig:set string="County Tax Accounts, 1781-1808">1114884</padig:set>
        <padig:set string="Court of Admiralty Accounts, 1779-1786">1114885</padig:set>
        <padig:set string="Day Book of General Benedict Arnold, 1777-1779">1114886</padig:set>
        <padig:set string="Delaware River Fortification Accounts, 1775-1798">1114887</padig:set>
        <padig:set string="Funded and Unfunded Debt Accounts, 1790-1799, undated">1114888</padig:set>
        <padig:set string="General Correspondence, 1776-1809">1114889</padig:set>
        <padig:set string="Index to Ledger AA, 1777-1788">1114898</padig:set>
        <padig:set string="Indian Commissioners' Accounts, 1784-1792">1114906</padig:set>
        <padig:set string="Internal Improvements File, Consisting of Accounts and Papers Relating to Canal and Navigation Companies Roads and Turnpikes River Improvements Public, 1777-1809">1114914</padig:set>
        <padig:set string="Journals, 1799-1808">1137673</padig:set>
        <padig:set string="Journals A-AAA, 1773-1795">1137674</padig:set>
        <padig:set string="Ledgers A-AA, 1775-1788">1137675</padig:set>
        <padig:set string="Letter Books and Indexes, 1782-1786, 1788-1803">1137676</padig:set>
        <padig:set string="List of Printed Accounts in the Comptroller General's Office, undated">1137677</padig:set>
        <padig:set string="An Alphabetical List of Those Who Received Money of the State and For Whom No Account was Raised, circa 1790">1137678</padig:set>
        <padig:set string="Memoranda Book, 1791">1137679</padig:set>
        <padig:set string="Memoranda Book of Old Accounts Not to Be Found in the New Alphabet, undated">1137680</padig:set>
        <padig:set string="Memoranda of Account Book, 1791">1137681</padig:set>
        <padig:set string="Militia Absentee Return Record for Philadelphia City, 1777-1791">1137682</padig:set>
        <padig:set string="Militia Exemption Books, 1801-1813">1137683</padig:set>
        <padig:set string="Militia Fine Exoneration Records, 1777-1793">1137684</padig:set>
        <padig:set string="Miscellaneous Accounts Including Records of Transactions Involving the Commonwealth and the United States, 1775-1810, undated">1137685</padig:set>
        <padig:set string="New Loan Accounts, 1776-1795">1137686</padig:set>
        <padig:set string="Indian Commissioners' Account Book, 1784-1785">1137687</padig:set>
        <padig:set string="Officers' Claim Book for Arrears in Clothing, 1778-1791">1146855</padig:set>
        <padig:set string="Officers' Clothing Account Book, 1791">1175580</padig:set>
        <padig:set string="Register of Accounts Received from the Register General, 1790-1792">1175581</padig:set>
        <padig:set string="Register of Executive Accounts, 1784-1791">1175582</padig:set>
        <padig:set string="Report Book of the State Treasurer, 1783">1175583</padig:set>
        <padig:set string="Report Books of the Committee of the Assembly on the State of the Public Accounts, 1778-1780">1175584</padig:set>
        <padig:set string="Return Book of Officers and Soldiers to Whom Patents Were Not Issued, undated">1175585</padig:set>
        <padig:set string="Return Book of the Pennsylvania Line Entitled to Donation Lands, undated">1175586</padig:set>
        <padig:set string="Specie Day Book and Waste Books, 1775-1790">1175587</padig:set>
        <padig:set string="Specie Journals, 1775-1790">1175588</padig:set>
        <padig:set string="Specie Ledger, 1775-1790">1175589</padig:set>
        <padig:set string="Specie Ledger's Balance Books, 1775-1790">1175590</padig:set>
        <padig:set string="State Departmental Accounts, 1782-1809, undated">1175591</padig:set>
        <padig:set string="A State of the Finances of the Commonwealth of Pennsylvania by John Nicholson, 1787">1175592</padig:set>
        <padig:set string="State Treasurer's Reports, 1790-1797, 1800-1809">1175593</padig:set>
        <padig:set string="Statement of Public Accounts Book, 1790-1791">1175594</padig:set>
        <padig:set string="Tryal Balance Book, undated">1175595</padig:set>
        <padig:set string="Unidentified Indexes, Day Books, and New Loan Accounts, 1781-1808, undated">1175596</padig:set>
        <padig:set string="United States Lottery Stub Book, 1776">1175597</padig:set>
        <padig:set string="Warrant Books, 1791-1808">1175598</padig:set>
        <padig:set string="Warrant Counterpart Records, 1792-1799, 1806-1808">1175599</padig:set>
        <padig:set string="Warrant Registers and Index, 1782-1805">1175600</padig:set>
        <padig:set string="Warrants, 1778-1809">1197535</padig:set>
        <padig:set string="Waste Book Indexes, 1776-1792">1197536</padig:set>
        <padig:set string="Waste Books, 1776-1792">1197537</padig:set>
        <padig:set string="Western Expedition (Whiskey Rebellion) Accounts, 1794-1804">1197538</padig:set>
        <padig:set string="Port of Philadelphia Records: Abstracts of Duties and Drawbacks, 1784-1789">1197539</padig:set>
        <padig:set string="Port of Philadelphia Records: Account of Duties and Drawbacks, 1783">1197540</padig:set>
        <padig:set string="Port of Philadelphia Records: Accounts and Certificates of the Collector of Head Money, 1791-1808">1197541</padig:set>
        <padig:set string="Port of Philadelphia Records: Accounts and Receipts of the Tonnage Office, 1783-1789">1197542</padig:set>
        <padig:set string="Port of Philadelphia Records: Accounts Current of the Collector's Office, 1784-1789">1197543</padig:set>
        <padig:set string="Port of Philadelphia Records: Bonds and Papers Relating to Duties on 'Negro' and 'Mulatto' Slaves, 1720-1788">1197544</padig:set>
        <padig:set string="Port of Philadelphia Records: Cargo Manifests, Inventories, and Bills of Lading, 1773-1833">1209885</padig:set>
        <padig:set string="Port of Philadelphia Records: Cargo Manifests, Inventories, and Bills of Lading, 1773-1833">1209885</padig:set>
        <padig:set string="Port of Philadelphia Records: Coasting Permits, 1796, 1806">1209886</padig:set>
        <padig:set string="Port of Philadelphia Records: Coasting Permits, 1796, 1806">1209886</padig:set>
        <padig:set string="Port of Philadelphia Records: Drawbacks and Vouchers Paid by the Collector of Duties, 1784-1789">1209887</padig:set>
        <padig:set string="Port of Philadelphia Records: Drawbacks and Vouchers Paid by the Collector of Duties, 1784-1789">1209887</padig:set>
        <padig:set string="Port of Philadelphia Records: Expenditures and Receipts of the Collector's Office, 1784-1789">1209888</padig:set>
        <padig:set string="Port of Philadelphia Records: Expenditures and Receipts of the Collector's Office, 1784-1789">1209888</padig:set>
        <padig:set string="Port of Philadelphia Records: Lists of Bonds Cancelled, 1774-1775">1209889</padig:set>
        <padig:set string="Port of Philadelphia Records: Lists of Bonds Cancelled, 1774-1775">1209889</padig:set>
        <padig:set string="Port of Philadelphia Records: Lists of Bonds, 1774-1775">1209890</padig:set>
        <padig:set string="Port of Philadelphia Records: Lists of Bonds, 1774-1775">1209890</padig:set>
        <padig:set string="Port of Philadelphia Records: Miscellaneous Records, 1782-1834">1209891</padig:set>
        <padig:set string="Port of Philadelphia Records: Miscellaneous Records, 1782-1834">1209891</padig:set>
        <padig:set string="Port of Philadelphia Records: Record Books of Bonds Due the Custom House, 1785-1788">1209892</padig:set>
        <padig:set string="Port of Philadelphia Records: Record Books of Bonds Due the Custom House, 1785-1788">1209892</padig:set>
        <padig:set string="Port of Philadelphia Records: Records of the Health Office, 1783-1798">1209893</padig:set>
        <padig:set string="Port of Philadelphia Records: Records of the Health Office, 1783-1798">1209893</padig:set>
        <padig:set string="Port of Philadelphia Records: Records of the Wardens of the Port, 1776-1809">1209894</padig:set>
        <padig:set string="Port of Philadelphia Records: Records of the Wardens of the Port, 1776-1809">1209894</padig:set>
        <padig:set string="Port of Philadelphia Records: Register of Drawbacks on Goods Exported, 1785-1786">1209895</padig:set>
        <padig:set string="Port of Philadelphia Records: Register of Drawbacks on Goods Exported, 1785-1786">1209895</padig:set>
        <padig:set string="Port of Philadelphia Records: Registers of Duties Paid on Imported Goods, 1781-1787">1209896</padig:set>
        <padig:set string="Port of Philadelphia Records: Registers of Duties Paid on Imported Goods, 1781-1787">1209896</padig:set>
        <padig:set string="Port of Philadelphia Records: Registers of Tonnage Duties, 1775-1776, 1784-1789">1209897</padig:set>
        <padig:set string="Port of Philadelphia Records: Registers of Tonnage Duties, 1775-1776, 1784-1789">1209897</padig:set>
        <padig:set string="Port of Philadelphia Records: Registry Statements of Cargo Contents Duties Paid and Drawbacks, 1782-1785, 1788">1209898</padig:set>
        <padig:set string="Port of Philadelphia Records: Registry Statements of Cargo Contents Duties Paid and Drawbacks, 1782-1785, 1788">1209898</padig:set>
        <padig:set string="Port of Philadelphia Records: Reports of Imposts Due, 1783-1788">1209899</padig:set>
        <padig:set string="Port of Philadelphia Records: Reports of Imposts Due, 1783-1788">1209899</padig:set>
        <padig:set string="Port of Philadelphia Records: Vessel Registry Vouchers, 1781-1782">1209900</padig:set>
        <padig:set string="Port of Philadelphia Records: Vessel Registry Vouchers, 1781-1782">1209900</padig:set>
        <padig:set string="Conservation and Natural Resources, Department of">1209901</padig:set>
        <padig:set string="Conservation and Natural Resources Advisory Council">1209902</padig:set>
        <padig:set string="Meeting Minutes and Agendas, 2018-2019">1209903</padig:set>
        <padig:set string="Constitutional Conventions and Council of Censors">1210333</padig:set>
        <padig:set string="Constitutional Convention of 1776">1210334</padig:set>
        <padig:set string="Council of Censors, 1783-1784">1210335</padig:set>
        <padig:set string="Constitutional Convention of 1837-1838">1210336</padig:set>
        <padig:set string="Constitutional Convention of 1873">1210337</padig:set>
        <padig:set string="General Loan Office and State Treasurer">1210348</padig:set>
        <padig:set string="Minute Book, 1776">1210349</padig:set>
        <padig:set string="Accounts, 1837-1839">1210350</padig:set>
        <padig:set string="Committee Minute Books, 1837-1838">1210351</padig:set>
        <padig:set string="Journal, 1837-1838">1210352</padig:set>
        <padig:set string="Journal, 1873">1210353</padig:set>
        <padig:set string="Journals, 1783-1784">1210354</padig:set>
        <padig:set string="Capitol Complex Restoration and Conservation Reports, 1897-2016">1210359</padig:set>
        <padig:set string="Committee Book, 1785">1210360</padig:set>
        <padig:set string="Legislative Proceedings from the Senate Library, 1854-1905">1210361</padig:set>
        <padig:set string="Committee Books, 1810-1850">1210362</padig:set>
        <padig:set string="Mortgage Books, 1774-1788">1210363</padig:set>
        <padig:set string="Mortgages and Related Valuations, 1773-1793">1210364</padig:set>
        <padig:set string="Governor, Office of the">1210365</padig:set>
        <padig:set string="Scrapbooks, 1917-1920">1210366</padig:set>
        <padig:set string="Correspondence and Issue Files, 1873-1879">1210367</padig:set>
        <padig:set string="Works Progress Administration Bituminous Coal and Coal Mining Maps, 1934-1936">1210368</padig:set>
        <padig:set string="Minute Books, 1923-1931, 1969">1221857</padig:set>
        <padig:set string="Sanitary Water Board (1923-1970)">1222003</padig:set>
        <padig:set string="Working Files of the Works Progress Administration's Pennsylvania Historical Survey (ca. 1935-1950)">1243319</padig:set>
        <padig:set string="Transcripts of Alphabetical Index to Naturalization Records, from 1789 through 1880 transcribed circa 1937-1941">1243320</padig:set>
        <padig:set string="Transcripts of Alphabetical List of Crews 1798-1880, transcribed, circa 1937-1941">1243321</padig:set>
        <padig:set string="Transcripts of Arrivals and Clearances of Vessels 1783-1880, transcribed circa, 1937-1941">1243322</padig:set>
        <padig:set string="Administrative and Biennial Reports, 1915-1934">1243323</padig:set>
        <padig:set string="Commissioners (1945-present)">1243324</padig:set>
        <padig:set string="Annual, Biennial, and Miscellaneous Reports of the Commission, 1945-2005">1243325</padig:set>
        <padig:set string="Individual Historic Properties (1930-present)">1247529</padig:set>
        <padig:set string="The Venango Trail, 1940">1247530</padig:set>
        <padig:set string="Transcripts and Translations (Including the Journal of Chaussegras de Lery), 1938-1942">1247531</padig:set>
        <padig:set string="Transcripts of Index of Vessels 1874-1937, transcribed, circa 1937-1941">1247532</padig:set>
        <padig:set string="Transcripts of Port Warden's Minutes 1766-1880, transcribed, circa 1937-1941">1247533</padig:set>
        <padig:set string="Transcripts of Records of Wrecks 1874-1937, transcribed, circa 1937-1941">1247534</padig:set>
        <padig:set string="Transcripts of Ship Manifests and Bonds: Port of Philadelphia circa 1814, transcribed, circa 1937-1941">1247535</padig:set>
        <padig:set string="Transcripts of Slave Manifests 1800-1841, transcribed, circa 1937-1941">1247536</padig:set>
        <padig:set string="Transcripts, including Gifford Pinchot Calendar, County Commissioners' Minutes, Road Dockets and Vital Statistics, 1939-1942">1247537</padig:set>
        <padig:set string="Transcripts of Chronological List of Masters and Crews 1798-1880, compiled circa 1937-1941">1247538</padig:set>
        <padig:set string="Old Economy Register of the Members of the Harmony Society, 1805-1905">1247539</padig:set>
        <padig:set string="Pennsylvania Notes, 1937-1939">1247540</padig:set>
        <padig:set string="Publications (Including the Expedition of Baron de Longueuil), 1939-1942">1247541</padig:set>
        <padig:set string="Project - Index to Philadelphia Register of Deaths 1803-1860">1247542</padig:set>
        <padig:set string="Project - Inventory of Canal Commissioners' Maps in the Pennsylvania State Archives, 1968">1247543</padig:set>
        <padig:set string="Manual for Newspaper Transcription, 1941">1247544</padig:set>
        <padig:set string="Job 72: Encyclopedia of Pennsylvania Biographies, 1938-1941">1247545</padig:set>
        <padig:set string="Guide to Depositories of Manuscript Collections in Pennsylvania, 1939">1247546</padig:set>
        <padig:set string="Harrisburg Unit Unpublished Manuscripts, including Guide to the Manuscript Collections and Holdings of the Archives Division of the Pennsylvania State, 1942, undated">1247547</padig:set>
        <padig:set string="Inventory of Church Archives of Pennsylvania, including Records of Pennsylvania Jewish Congregations, 1937-1940, undated">1247548</padig:set>
        <padig:set string="Newspaper Transcripts and Checklists of 18th and 19th Century Articles, circa 1940-1942">1247549</padig:set>
        <padig:set string="Port of Philadelphia">1247550</padig:set>
        <padig:set string="Pilots' Report Books 1793-1826">1247551</padig:set>
        <padig:set string="Registers of Pilots' Names and Securities, 1795-1804">1247552</padig:set>
        <padig:set string="Registers of Vessel Arrivals and Clearances, 1784-1797">1247553</padig:set>
        <padig:set string="Shipping Bonds and Certificates, 1752-1775">1247554</padig:set>
        <padig:set string="Surveys of Damaged Cargoes, 1784-1790">1247555</padig:set>
        <padig:set string="Time Books of Wardens' Attendance, 1784-1802">1247556</padig:set>
        <padig:set string="Tonnage Registers 1784-1789, 1794-1795">1247557</padig:set>
        <padig:set string="Wharf License Books, 1864-1979">1247558</padig:set>
        <padig:set string="Accounts of the Wardens of the Port, 1763-1800">1247559</padig:set>
        <padig:set string="Declaration Books of British Vessel Registry, 1727-1776">1247560</padig:set>
        <padig:set string="Health Officer's Account of Passenger Entries, 1789-1794">1247561</padig:set>
        <padig:set string="Letter Books, 1793-1799">1247562</padig:set>
        <padig:set string="Minute Books of the Wardens of the Port, the Board Commissioners of Navigation, and the Navigation Commission, 1766-1773, 1783-1800">1247563</padig:set>
        <padig:set string="Pilot Apprentice Indenture Books, 1806-1931">1247564</padig:set>
        <padig:set string="Admission Book, 1896-1947">1247565</padig:set>
        <padig:set string="Philadelphia Maritime Academy">1247566</padig:set>
        <padig:set string="Pennsylvania Game Commission">1247567</padig:set>
        <padig:set string="Executive Office">1247568</padig:set>
        <padig:set string="Meeting Minutes and Related Records, 1972-1976">1247569</padig:set>
        <padig:set string="Coal Industry Environmental Studies, circa 1943-1964">1247570</padig:set>
        <padig:set string="Investigative Reports (after plant closures) of Health Hazards in Industrial Plants, circa 1941-1973">1247571</padig:set>
        <padig:set string="Minutes of the Pennsylvania Historical Commission, 1924-1925, 1927-1945">1250945</padig:set>
        <padig:set string="State Tax Equalization Board">1282778</padig:set>
        <padig:set string="Minute Books, 1947-1999">1282931</padig:set>
        <padig:set string="Port Physician's Certificates, 1741, 1753-1755">1372443</padig:set>
        <padig:set string="Lancaster District (1803-1829)">1403349</padig:set>
        <padig:set string="Court of Admiralty">1415069</padig:set>
        <padig:set string="Writs of Habeas Corpus for Black Slaves and Indentured Servants, 1784-1787">1415070</padig:set>
        <padig:set string="Admission of Attorneys Dockets, 1742-1902">1428304</padig:set>
        <padig:set string="Autograph File, 1683, 1767-1815">1428305</padig:set>
        <padig:set string="Bundles of Miscellaneous Court Papers with Index, 1790-1883">1428306</padig:set>
        <padig:set string="Claims Docket, 1778-1779">1428307</padig:set>
        <padig:set string="Continuance Dockets, 1795-1837">1428308</padig:set>
        <padig:set string="Coroners' Inquisition Papers, 1751, 1768-1796">1428309</padig:set>
        <padig:set string="Declaration of Intention Dockets, 1819-1870, 1873-1875, 1881-1906">1428310</padig:set>
        <padig:set string="Divorce Papers, 1786-1815">1428311</padig:set>
        <padig:set string="Equity Dockets, 1836-1875, 1877, 1880">1428312</padig:set>
        <padig:set string="Escheat Papers, 1781-1822, undated">1428313</padig:set>
        <padig:set string="Execution Dockets, 1786-1873">1428314</padig:set>
        <padig:set string="General Motions and Divorce Docket, 1750-1837">1449560</padig:set>
        <padig:set string="Minute Books, 1806-1816, 1819-1952">1449647</padig:set>
        <padig:set string="Miscellaneous Records of the Supreme Court of Nisi Prius, circa 1786-1800">1449698</padig:set>
        <padig:set string="Miscellaneous Supreme and Superior Court Dockets, 1743-1749">1449825</padig:set>
        <padig:set string="Papers in Attainder Relating to Estates Forfeited by Treason, circa 1778-1791">1449900</padig:set>
        <padig:set string="Perpetuation of Testimony Dockets, 1781-1801">1449962</padig:set>
        <padig:set string="Recognizance Papers, 1754-1823">1450081</padig:set>
        <padig:set string="Sheriff's Deed Books and Lists of Attorneys Admitted, 1796-1876">1450192</padig:set>
        <padig:set string="Warrant of Attorney Dockets, 1795-1874">1450244</padig:set>
        <padig:set string="Writs of Habeas Corpus and Petitions, 1771-1773, 1775, 1786-1787">1450325</padig:set>
        <padig:set string="Precepts of the Court of Admiralty, 1781-1788">1450394</padig:set>
        <padig:set string="Case Files of the Court of Admiralty, 1760-1795">1450467</padig:set>
        <padig:set string="Minute Books, 1834-1838, 1854-1857, 1859-1990">1450515</padig:set>
        <padig:set string="Minute Books of the Lancaster District, 1810-1829">1450528</padig:set>
        <padig:set string="Braddock Road Accounts, 1755-1756">1450699</padig:set>
        <padig:set string="Provincial Officers' Sureties, 1742-1776">1451041</padig:set>
        <padig:set string="Registrar's Book of Governor Keith's Court of Chancery, 1720-1736">1451096</padig:set>
        <padig:set string="Richard Partridge Account Book, 1740-1751">1451142</padig:set>
        <padig:set string="Secretary's Accounts, 1738-1774">1451187</padig:set>
        <padig:set string="Waste Book of Thomas Murray and Nathaniel Puckle, 1702-1707, 1721">1451239</padig:set>
        <padig:set string="Scrapbooks, 1918-1940">1451618</padig:set>
        <padig:set string="Valley Forge Park Commission">1524805</padig:set>
        <padig:set string="Minute Books, 1893-1977">1524806</padig:set>
        <padig:set string="Lieutenant Governor, Office of the">1524807</padig:set>
        <padig:set string="Board of Pardons">1524808</padig:set>
        <padig:set string="Minutes, 1974-1999">1524809</padig:set>
        <padig:set string="Governor's Sportsman Advisory Council and Governor's Youth Sportsmen's Advisory Council Files, 1996-2003">1524810</padig:set>
        <padig:set string="Schuylkill Navigation Company/Schuylkill River Project, Engineer's Records, circa 1850-1940">1524811</padig:set>
        <padig:set string="Bedford County Associators">1529900</padig:set>
        <padig:set string="Berks County Associators">1529901</padig:set>
        <padig:set string="Bucks County Associators">1529902</padig:set>
        <padig:set string="Chester County Associators">1529903</padig:set>
        <padig:set string="Cumberland County Associators">1529904</padig:set>
        <padig:set string="Lancaster County Associators">1529905</padig:set>
        <padig:set string="Northampton County Associators">1529906</padig:set>
        <padig:set string="Northumberland County Associators">1529907</padig:set>
        <padig:set string="Philadelphia City Associators">1529908</padig:set>
        <padig:set string="Philadelphia County Associators">1529909</padig:set>
        <padig:set string="Westmoreland County Associators">1529910</padig:set>
        <padig:set string="York County Associators">1529911</padig:set>
        <padig:set string="Minutes of the Court of Admiralty, 1780-1782, 1784-1786, 1788">1538597</padig:set>
        <padig:set string="Collection Test PSA 1">1540619</padig:set>
        <padig:set string="Collection Test PSA 2">1540661</padig:set>
        <padig:set string="Collection Test PSA 3">1540662</padig:set>
        <padig:set string="CollectionTest">1540663</padig:set>
        <padig:set string="State Board of Private Academic Schools">1540685</padig:set>
        <padig:set string="Minutes, 2018">1540686</padig:set>
        <padig:set string="Minute Books of the Board of Inspectors and Board of Trustees, 1829-1889">1540687</padig:set>
        <padig:set string="Medical Statistics Books, 1883-1900">1540688</padig:set>
        <padig:set string="Prison Administration Records: General Correspondence, 1891-1946, not inclusive">1540689</padig:set>
        <padig:set string="Prison Administration Records: Journals of the General Superintendent, 1891-1922">1540690</padig:set>
        <padig:set string="Prison Administration Records: Letter Press Books, 1879-1880, 1884-1895">1540691</padig:set>
        <padig:set string="Reports and Testimony in Relation to Investigations Made by a Subcommittee of the State Board of Charities and the Board of Trustees, 1890-1892, 1894, 1896, 1935">1540692</padig:set>
        <padig:set string="Prison Population Records: School Attendance Record, 1935-1936">1540693</padig:set>
        <padig:set string="Prison Population Records: School Examination Question Book, 1892-1897">1540694</padig:set>
        <padig:set string="Community and Economic Development, Department of (DCED)">1540695</padig:set>
        <padig:set string="Pennsylvania Minority Business Development Authority (PMBDA), Minutes, 1979-1993">1540696</padig:set>
        <padig:set string="Fish and Boat Commission">1540697</padig:set>
        <padig:set string="Minutes, 1924-1954, 1968-1969">1540698</padig:set>
    </xsl:param>

    <!-- lookup table collection name by identifier -->
    <xsl:param name="recordIDList">
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:479</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:480</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:481</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:483</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:484</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:485</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:486</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:487</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:488</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:489</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:490</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:491</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:492</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:493</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:495</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:496</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:497</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:498</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:499</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:500</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:501</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:502</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:503</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:506</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:507</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:510</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:511</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:512</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:514</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:515</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:516</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:517</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:518</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:519</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:520</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:521</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:522</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:523</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:524</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:525</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:526</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:527</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:528</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:531</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:532</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:533</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:534</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:535</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:643</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:644</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:645</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:646</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:647</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:648</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:649</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:650</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:651</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:653</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:654</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:655</padig:recordID>
        <padig:recordID string="Sunbury History Harvest">oai:www.pahistoryharvest.com:656</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:253</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:254</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:255</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:256</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:257</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:258</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:259</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:260</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:261</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:262</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:263</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:264</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:265</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:267</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:268</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:269</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:270</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:271</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:272</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:273</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:274</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:275</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:276</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:277</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:278</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:279</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:280</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:281</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:282</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:283</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:284</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:285</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:288</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:289</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:291</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:292</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:330</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:331</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:332</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:333</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:334</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:335</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:336</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:337</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:340</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:341</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:342</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:343</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:344</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:345</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:346</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:347</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:349</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:350</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:351</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:352</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:355</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:357</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:359</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:360</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:361</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:362</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:363</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:364</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:365</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:411</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:414</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:415</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:416</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:417</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:418</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:419</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:420</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:421</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:422</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:423</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:424</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:425</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:426</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:427</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:428</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:429</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:430</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:431</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:432</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:433</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:434</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:436</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:536</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:538</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:541</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:542</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:543</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:544</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:598</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:625</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:626</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:627</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:628</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:629</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:630</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:631</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:632</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:633</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:634</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:635</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:636</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:637</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:638</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:639</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:640</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:641</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:642</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:760</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:761</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:762</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:763</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:764</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:765</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:766</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:768</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:770</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:771</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:772</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:773</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:774</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:775</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:776</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:777</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:778</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:779</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:780</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:781</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:782</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:783</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:784</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:821</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:822</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:823</padig:recordID>
        <padig:recordID string="Milton History Harvest">oai:www.pahistoryharvest.com:824</padig:recordID>
    </xsl:param>

    <!-- lookup table for Omeka setSpec, College of Physicians of Philadelphia -->
    <xsl:param name="cppSetSpecList">
        <padig:set string="Images from Les Oeuvres d'Ambroise Paré">3</padig:set>
        <padig:set string="Radium in America">5</padig:set>
        <padig:set string="Under the Influence of the Heavens">6</padig:set>
        <padig:set string="Memento Mütter - Additional Images">8</padig:set>
        <padig:set string="Feldtbůch der Wundtartzney, Hans von Gersdorff">9</padig:set>
        <padig:set string="Philadelphia General Hospital (Blockley Almshouse)">10</padig:set>
        <padig:set string="Camp life in the Rockies, H.C. Wood">11</padig:set>
        <padig:set string="The Anatomy of a Horse, George Stubbs">12</padig:set>
        <padig:set string="A Philadelphia Physician Encounters the Great War">13</padig:set>
        <padig:set string="De humani corporis fabrica, Vesalius">14</padig:set>
        <padig:set string="Anatomia del cavallo, Carlo Ruini">15</padig:set>
        <padig:set string="Tabulae sceleti et musculorum corporis humani, Bernhard Siegfried Albinus">16</padig:set>
        <padig:set string="Gray's Anatomy">17</padig:set>
        <padig:set string="Surgical Anatomy, Joseph Maclise">18</padig:set>
        <padig:set string="The Morbid Anatomy, Matthew Baillie">19</padig:set>
        <padig:set string="The anatomy of the human gravid uterus, William Hunter">20</padig:set>
        <padig:set string="Anatomia humani corporis, Govard Bidloo">21</padig:set>
        <padig:set string="Osteographia, William Cheselden">22</padig:set>
        <padig:set string="Historia de la composicion del cuerpo humano, Juan Valverde de Amusco">23</padig:set>
        <padig:set string="Tabulae anatomicae, Bartolomeo Eustachi">24</padig:set>
        <padig:set string="The Surgeons Mate, Portraits">25</padig:set>
        <padig:set string="Clysmatica nova, blood transfusions">26</padig:set>
        <padig:set string="Prognosticatio eximii doctoris, Theophrasti Paracelsi">27</padig:set>
        <padig:set string="Medical Botany, William Woodville">28</padig:set>
        <padig:set string="Buch der Cirurgia, Hieronymus Brunschwig">29</padig:set>
        <padig:set string="Cognitione de muscoli del corpo humano, Carlo Cesi">30</padig:set>
        <padig:set string="Traité théorique et pratique des maladies de la peau, Pierre-François Olive Rayer">31</padig:set>
        <padig:set string="Illustrations of Medical Botany, Joseph Carson">32</padig:set>
        <padig:set string="Thesaurus Anatomicus, Frederik Ruysch">33</padig:set>
        <padig:set string="Theatrum anatomicum, Caspar Bauhin">34</padig:set>
        <padig:set string="Le Grant Herbier">35</padig:set>
        <padig:set string="Orang-outang, Edward Tyson">36</padig:set>
        <padig:set string="Pestbuch, Hieronymus Brunschwig">37</padig:set>
        <padig:set string="Anatomia per uso dei pittori e scultori, Giuseppe del Medico">38</padig:set>
        <padig:set string="Anthropogenie, oder, Entwickelungsgeschichte des menschen, Ernst Haeckel">39</padig:set>
        <padig:set string="A System of Human Anatomy, Harrison Allen">40</padig:set>
        <padig:set string="Traité d'anatomie humaine (1891), Leo Testut">41</padig:set>
        <padig:set string="Anatomy of the Humane Body, William Cheselden">42</padig:set>
        <padig:set string="American Medical Botany, Jacob Bigelow">43</padig:set>
        <padig:set string="Isagogae breves, Jacopo Berengario da Carpi">44</padig:set>
        <padig:set string="Tabulae VII uteri mulieris gravidae cum iam parturiret mortuae, Bernhard Siegfried Albinus">45</padig:set>
        <padig:set string="The Battle Creek Sanitarium">46</padig:set>
        <padig:set string="George Outerbridge">47</padig:set>
        <padig:set string="Bad Medicine">48</padig:set>
        <padig:set string="[Ophthalmodouleia], das ist Augendienst, Georg Bartisch">49</padig:set>
        <padig:set string="Traité des Maladies des Yeux, Antoine Pierre Demours">50</padig:set>
        <padig:set string="Abraham Jacobi letters relating to Mount Sinai Hospital, New York">51</padig:set>
        <padig:set string="Sophia Perry diaries">53</padig:set>
    </xsl:param>

    <!-- lookup table for Omeka setSpec, Media Historic Archives Commission -->
    <xsl:param name="mhacSetSpecList">
        <padig:set string="Stephen H. Appleton Photograph Collection">1</padig:set>
        <padig:set string="I. Frank Lees Photograph Collection">2</padig:set>
        <padig:set string="Francis F. Zimmerman Photograph Collection">3</padig:set>
    </xsl:param>

    <!-- lookup table for Omeka setSpec, Susquehanna University -->
    <xsl:param name="susquSetSpecList">
        <padig:set string="Susquehanna University History Harvest">1</padig:set>
        <padig:set string="Snyder County History Harvest">2</padig:set>
        <padig:set string="Milton History Harvest">3</padig:set>
        <padig:set string="Sunbury History Harvest">4</padig:set>
        <padig:set string="Northumberland County Historical Society Harvest">7</padig:set>
        <padig:set string="Susquehanna University History Harvest 2017">8</padig:set>
        <padig:set string="Selinsgrove History Harvest">10</padig:set>
    </xsl:param>

    <!-- lookup table for Omeka setSpec, Catholic Historical Research Center -->
    <xsl:param name="chrcSetSpecList">
        <padig:set string="Graphics">1</padig:set>
        <padig:set string="Photographs">2</padig:set>
        <padig:set string="Church Buildings">3</padig:set>
        <padig:set string="Pamphlets">4</padig:set>
        <padig:set string="The American Celt">5</padig:set>
        <padig:set string="Correspondence">8</padig:set>
    </xsl:param>

    <!-- lookup table for Omeka setSpec, Moravian Historical Society -->
    <xsl:param name="moravianSetSpecList">
        <padig:set string="Moravian Historical Society Annual Lectures">587</padig:set>
        <padig:set string="The Moravian Newspaper">588</padig:set>
        <padig:set string="Nazareth Hall">589</padig:set>
        <padig:set string="Nazareth in the Eighteenth Century Paper">1334</padig:set>
        <padig:set string="Henry Family Letters">2330</padig:set>
        <padig:set string="Boulton Gun Works">2331</padig:set>
        <padig:set string="Civil War News">2332</padig:set>
        <padig:set string="William Henry I">2333</padig:set>
    </xsl:param>

    <!-- lookup table for dplah language transforms -->
    <xsl:param name="dplahLang">
        <padig:language string="Afar">aar</padig:language>
        <padig:language string="Abkhaz">abk</padig:language>
        <padig:language string="Achinese">ace</padig:language>
        <padig:language string="Acoli">ach</padig:language>
        <padig:language string="Adangme">ada</padig:language>
        <padig:language string="Adygei">ady</padig:language>
        <padig:language string="Afroasiatic (Other)">afa</padig:language>
        <padig:language string="Afrihili (Artificial language)">afh</padig:language>
        <padig:language string="Afrikaans">afr</padig:language>
        <padig:language string="Aljamia">ajm</padig:language>
        <padig:language string="Akan">aka</padig:language>
        <padig:language string="Akkadian">akk</padig:language>
        <padig:language string="Albanian">alb</padig:language>
        <padig:language string="Aleut">ale</padig:language>
        <padig:language string="Algonquian (Other)">alg</padig:language>
        <padig:language string="Amharic">amh</padig:language>
        <padig:language string="English, Old (ca. 450-1100)">ang</padig:language>
        <padig:language string="Apache languages">apa</padig:language>
        <padig:language string="Arabic">ara</padig:language>
        <padig:language string="Aramaic">arc</padig:language>
        <padig:language string="Aragonese Spanish">arg</padig:language>
        <padig:language string="Armenian">arm</padig:language>
        <padig:language string="Mapuche">arn</padig:language>
        <padig:language string="Arapaho">arp</padig:language>
        <padig:language string="Artificial (Other)">art</padig:language>
        <padig:language string="Arawak">arw</padig:language>
        <padig:language string="Assamese">asm</padig:language>
        <padig:language string="Bable">ast</padig:language>
        <padig:language string="Athapascan (Other)">ath</padig:language>
        <padig:language string="Australian languages">aus</padig:language>
        <padig:language string="Avaric">ava</padig:language>
        <padig:language string="Avestan">ave</padig:language>
        <padig:language string="Awadhi">awa</padig:language>
        <padig:language string="Aymara">aym</padig:language>
        <padig:language string="Azerbaijani">aze</padig:language>
        <padig:language string="Banda">bad</padig:language>
        <padig:language string="Bamileke languages">bai</padig:language>
        <padig:language string="Bashkir">bak</padig:language>
        <padig:language string="Baluchi">bal</padig:language>
        <padig:language string="Bambara">bam</padig:language>
        <padig:language string="Balinese">ban</padig:language>
        <padig:language string="Basque">baq</padig:language>
        <padig:language string="Basa">bas</padig:language>
        <padig:language string="Baltic (Other)">bat</padig:language>
        <padig:language string="Beja">bej</padig:language>
        <padig:language string="Belarusian">bel</padig:language>
        <padig:language string="Bemba">bem</padig:language>
        <padig:language string="Bengali">ben</padig:language>
        <padig:language string="Berber (Other)">ber</padig:language>
        <padig:language string="Bhojpuri">bho</padig:language>
        <padig:language string="Bihari">bih</padig:language>
        <padig:language string="Bikol">bik</padig:language>
        <padig:language string="Edo">bin</padig:language>
        <padig:language string="Bislama">bis</padig:language>
        <padig:language string="Siksika">bla</padig:language>
        <padig:language string="Bantu (Other)">bnt</padig:language>
        <padig:language string="Bosnian">bos</padig:language>
        <padig:language string="Braj">bra</padig:language>
        <padig:language string="Breton">bre</padig:language>
        <padig:language string="Batak">btk</padig:language>
        <padig:language string="Buriat">bua</padig:language>
        <padig:language string="Bugis">bug</padig:language>
        <padig:language string="Bulgarian">bul</padig:language>
        <padig:language string="Burmese">bur</padig:language>
        <padig:language string="Caddo">cad</padig:language>
        <padig:language string="Central American Indian (Other)">cai</padig:language>
        <padig:language string="Khmer">cam</padig:language>
        <padig:language string="Carib">car</padig:language>
        <padig:language string="Catalan">cat</padig:language>
        <padig:language string="Caucasian (Other)">cau</padig:language>
        <padig:language string="Cebuano">ceb</padig:language>
        <padig:language string="Celtic (Other)">cel</padig:language>
        <padig:language string="Chamorro">cha</padig:language>
        <padig:language string="Chibcha">chb</padig:language>
        <padig:language string="Chechen">che</padig:language>
        <padig:language string="Chagatai">chg</padig:language>
        <padig:language string="Chinese">chi</padig:language>
        <padig:language string="Truk">chk</padig:language>
        <padig:language string="Mari">chm</padig:language>
        <padig:language string="Chinook jargon">chn</padig:language>
        <padig:language string="Choctaw">cho</padig:language>
        <padig:language string="Chipewyan">chp</padig:language>
        <padig:language string="Cherokee">chr</padig:language>
        <padig:language string="Church Slavic">chu</padig:language>
        <padig:language string="Chuvash">chv</padig:language>
        <padig:language string="Cheyenne">chy</padig:language>
        <padig:language string="Chamic languages">cmc</padig:language>
        <padig:language string="Coptic">cop</padig:language>
        <padig:language string="Cornish">cor</padig:language>
        <padig:language string="Corsican">cos</padig:language>
        <padig:language string="Creoles and Pidgins, English-based (Other)">cpe</padig:language>
        <padig:language string="Creoles and Pidgins, French-based (Other)">cpf</padig:language>
        <padig:language string="Creoles and Pidgins, Portuguese-based (Other)">cpp</padig:language>
        <padig:language string="Cree">cre</padig:language>
        <padig:language string="Crimean Tatar">crh</padig:language>
        <padig:language string="Creoles and Pidgins (Other)">crp</padig:language>
        <padig:language string="Cushitic (Other)">cus</padig:language>
        <padig:language string="Czech">cze</padig:language>
        <padig:language string="Dakota">dak</padig:language>
        <padig:language string="Danish">dan</padig:language>
        <padig:language string="Dargwa">dar</padig:language>
        <padig:language string="Dayak">day</padig:language>
        <padig:language string="Delaware">del</padig:language>
        <padig:language string="Slave">den</padig:language>
        <padig:language string="Dogrib">dgr</padig:language>
        <padig:language string="Dinka">din</padig:language>
        <padig:language string="Divehi">div</padig:language>
        <padig:language string="Dogri">doi</padig:language>
        <padig:language string="Dravidian (Other)">dra</padig:language>
        <padig:language string="Duala">dua</padig:language>
        <padig:language string="Dutch, Middle (ca. 1050-1350)">dum</padig:language>
        <padig:language string="Dutch">dut</padig:language>
        <padig:language string="Dyula">dyu</padig:language>
        <padig:language string="Dzongkha">dzo</padig:language>
        <padig:language string="Efik">efi</padig:language>
        <padig:language string="Egyptian">egy</padig:language>
        <padig:language string="Ekajuk">eka</padig:language>
        <padig:language string="Elamite">elx</padig:language>
        <padig:language string="English">eng</padig:language>
        <padig:language string="English, Middle (1100-1500)">enm</padig:language>
        <padig:language string="Esperanto">epo</padig:language>
        <padig:language string="Eskimo languages">esk</padig:language>
        <padig:language string="Esperanto">esp</padig:language>
        <padig:language string="Estonian">est</padig:language>
        <padig:language string="Ethiopic">eth</padig:language>
        <padig:language string="Ewe">ewe</padig:language>
        <padig:language string="Ewondo">ewo</padig:language>
        <padig:language string="Fang">fan</padig:language>
        <padig:language string="Faroese">fao</padig:language>
        <padig:language string="Faroese">far</padig:language>
        <padig:language string="Fanti">fat</padig:language>
        <padig:language string="Fijian">fij</padig:language>
        <padig:language string="Finnish">fin</padig:language>
        <padig:language string="Finno-Ugrian (Other)">fiu</padig:language>
        <padig:language string="Fon">fon</padig:language>
        <padig:language string="French">fre</padig:language>
        <padig:language string="Frisian">fri</padig:language>
        <padig:language string="French, Middle (ca. 1400-1600)">frm</padig:language>
        <padig:language string="French, Old (ca. 842-1400)">fro</padig:language>
        <padig:language string="Frisian">fry</padig:language>
        <padig:language string="Fula">ful</padig:language>
        <padig:language string="Friulian">fur</padig:language>
        <padig:language string="Ga">gaa</padig:language>
        <padig:language string="Scottish Gaelic">gae</padig:language>
        <padig:language string="Galician">gag</padig:language>
        <padig:language string="Oromo">gal</padig:language>
        <padig:language string="Gayo">gay</padig:language>
        <padig:language string="Gbaya">gba</padig:language>
        <padig:language string="Germanic (Other)">gem</padig:language>
        <padig:language string="Georgian">geo</padig:language>
        <padig:language string="German">ger</padig:language>
        <padig:language string="Ethiopic">gez</padig:language>
        <padig:language string="Gilbertese">gil</padig:language>
        <padig:language string="Scottish Gaelic">gla</padig:language>
        <padig:language string="Irish">gle</padig:language>
        <padig:language string="Galician">glg</padig:language>
        <padig:language string="Manx">glv</padig:language>
        <padig:language string="German, Middle High (ca. 1050-1500)">gmh</padig:language>
        <padig:language string="German, Old High (ca. 750-1050)">goh</padig:language>
        <padig:language string="Gondi">gon</padig:language>
        <padig:language string="Gorontalo">gor</padig:language>
        <padig:language string="Gothic">got</padig:language>
        <padig:language string="Grebo">grb</padig:language>
        <padig:language string="Greek, Ancient (to 1453)">grc</padig:language>
        <padig:language string="Greek, Modern (1453- )">gre</padig:language>
        <padig:language string="Guarani">grn</padig:language>
        <padig:language string="Guarani">gua</padig:language>
        <padig:language string="Gujarati">guj</padig:language>
        <padig:language string="Gwich'in">gwi</padig:language>
        <padig:language string="Haida">hai</padig:language>
        <padig:language string="Haitian French Creole">hat</padig:language>
        <padig:language string="Hausa">hau</padig:language>
        <padig:language string="Hawaiian">haw</padig:language>
        <padig:language string="Hebrew">heb</padig:language>
        <padig:language string="Herero">her</padig:language>
        <padig:language string="Hiligaynon">hil</padig:language>
        <padig:language string="Himachali">him</padig:language>
        <padig:language string="Hindi">hin</padig:language>
        <padig:language string="Hittite">hit</padig:language>
        <padig:language string="Hmong">hmn</padig:language>
        <padig:language string="Hiri Motu">hmo</padig:language>
        <padig:language string="Hungarian">hun</padig:language>
        <padig:language string="Hupa">hup</padig:language>
        <padig:language string="Iban">iba</padig:language>
        <padig:language string="Igbo">ibo</padig:language>
        <padig:language string="Icelandic">ice</padig:language>
        <padig:language string="Ido">ido</padig:language>
        <padig:language string="Sichuan Yi">iii</padig:language>
        <padig:language string="Ijo">ijo</padig:language>
        <padig:language string="Inuktitut">iku</padig:language>
        <padig:language string="Interlingue">ile</padig:language>
        <padig:language string="Iloko">ilo</padig:language>
        <padig:language string="Interlingua (International Auxiliary Language Association)">ina</padig:language>
        <padig:language string="Indic (Other)">inc</padig:language>
        <padig:language string="Indonesian">ind</padig:language>
        <padig:language string="Indo-European (Other)">ine</padig:language>
        <padig:language string="Ingush">inh</padig:language>
        <padig:language string="Interlingua (International Auxiliary Language Association)">int</padig:language>
        <padig:language string="Inupiaq">ipk</padig:language>
        <padig:language string="Iranian (Other)">ira</padig:language>
        <padig:language string="Irish">iri</padig:language>
        <padig:language string="Iroquoian (Other)">iro</padig:language>
        <padig:language string="Italian">ita</padig:language>
        <padig:language string="Javanese">jav</padig:language>
        <padig:language string="Japanese">jpn</padig:language>
        <padig:language string="Judeo-Persian">jpr</padig:language>
        <padig:language string="Judeo-Arabic">jrb</padig:language>
        <padig:language string="Kara-Kalpak">kaa</padig:language>
        <padig:language string="Kabyle">kab</padig:language>
        <padig:language string="Kachin">kac</padig:language>
        <padig:language string="Kalatdlisut">kal</padig:language>
        <padig:language string="Kamba">kam</padig:language>
        <padig:language string="Kannada">kan</padig:language>
        <padig:language string="Karen">kar</padig:language>
        <padig:language string="Kashmiri">kas</padig:language>
        <padig:language string="Kanuri">kau</padig:language>
        <padig:language string="Kawi">kaw</padig:language>
        <padig:language string="Kazakh">kaz</padig:language>
        <padig:language string="Kabardian">kbd</padig:language>
        <padig:language string="Khasi">kha</padig:language>
        <padig:language string="Khoisan (Other)">khi</padig:language>
        <padig:language string="Khmer">khm</padig:language>
        <padig:language string="Khotanese">kho</padig:language>
        <padig:language string="Kikuyu">kik</padig:language>
        <padig:language string="Kinyarwanda">kin</padig:language>
        <padig:language string="Kyrgyz">kir</padig:language>
        <padig:language string="Kimbundu">kmb</padig:language>
        <padig:language string="Konkani">kok</padig:language>
        <padig:language string="Komi">kom</padig:language>
        <padig:language string="Kongo">kon</padig:language>
        <padig:language string="Korean">kor</padig:language>
        <padig:language string="Kusaie">kos</padig:language>
        <padig:language string="Kpelle">kpe</padig:language>
        <padig:language string="Kru">kro</padig:language>
        <padig:language string="Kurukh">kru</padig:language>
        <padig:language string="Kuanyama">kua</padig:language>
        <padig:language string="Kumyk">kum</padig:language>
        <padig:language string="Kurdish">kur</padig:language>
        <padig:language string="Kusaie">kus</padig:language>
        <padig:language string="Kutenai">kut</padig:language>
        <padig:language string="Ladino">lad</padig:language>
        <padig:language string="Lahnda">lah</padig:language>
        <padig:language string="Lamba">lam</padig:language>
        <padig:language string="Occitan (post-1500)">lan</padig:language>
        <padig:language string="Lao">lao</padig:language>
        <padig:language string="Sami">lap</padig:language>
        <padig:language string="Latin">lat</padig:language>
        <padig:language string="Latvian">lav</padig:language>
        <padig:language string="Lezgian">lez</padig:language>
        <padig:language string="Limburgish">lim</padig:language>
        <padig:language string="Lingala">lin</padig:language>
        <padig:language string="Lithuanian">lit</padig:language>
        <padig:language string="Mongo-Nkundu">lol</padig:language>
        <padig:language string="Lozi">loz</padig:language>
        <padig:language string="Letzeburgesch">ltz</padig:language>
        <padig:language string="Luba-Lulua">lua</padig:language>
        <padig:language string="Luba-Katanga">lub</padig:language>
        <padig:language string="Ganda">lug</padig:language>
        <padig:language string="Luiseno">lui</padig:language>
        <padig:language string="Lunda">lun</padig:language>
        <padig:language string="Luo (Kenya and Tanzania)">luo</padig:language>
        <padig:language string="Lushai">lus</padig:language>
        <padig:language string="Macedonian">mac</padig:language>
        <padig:language string="Madurese">mad</padig:language>
        <padig:language string="Magahi">mag</padig:language>
        <padig:language string="Marshallese">mah</padig:language>
        <padig:language string="Maithili">mai</padig:language>
        <padig:language string="Makasar">mak</padig:language>
        <padig:language string="Malayalam">mal</padig:language>
        <padig:language string="Mandingo">man</padig:language>
        <padig:language string="Maori">mao</padig:language>
        <padig:language string="Austronesian (Other)">map</padig:language>
        <padig:language string="Marathi">mar</padig:language>
        <padig:language string="Masai">mas</padig:language>
        <padig:language string="Manx">max</padig:language>
        <padig:language string="Malay">may</padig:language>
        <padig:language string="Mandar">mdr</padig:language>
        <padig:language string="Mende">men</padig:language>
        <padig:language string="Irish, Middle (ca. 1100-1550)">mga</padig:language>
        <padig:language string="Micmac">mic</padig:language>
        <padig:language string="Minangkabau">min</padig:language>
        <padig:language string="Miscellaneous languages">mis</padig:language>
        <padig:language string="Mon-Khmer (Other)">mkh</padig:language>
        <padig:language string="Malagasy">mla</padig:language>
        <padig:language string="Malagasy">mlg</padig:language>
        <padig:language string="Maltese">mlt</padig:language>
        <padig:language string="Manchu">mnc</padig:language>
        <padig:language string="Manipuri">mni</padig:language>
        <padig:language string="Manobo languages">mno</padig:language>
        <padig:language string="Mohawk">moh</padig:language>
        <padig:language string="Moldavian">mol</padig:language>
        <padig:language string="Mongolian">mon</padig:language>
        <padig:language string="Moore">mos</padig:language>
        <padig:language string="Multiple languages">mul</padig:language>
        <padig:language string="Munda (Other)">mun</padig:language>
        <padig:language string="Creek">mus</padig:language>
        <padig:language string="Marwari">mwr</padig:language>
        <padig:language string="Mayan languages">myn</padig:language>
        <padig:language string="Nahuatl">nah</padig:language>
        <padig:language string="North American Indian (Other)">nai</padig:language>
        <padig:language string="Neapolitan Italian">nap</padig:language>
        <padig:language string="Nauru">nau</padig:language>
        <padig:language string="Navajo">nav</padig:language>
        <padig:language string="Ndebele (South Africa)">nbl</padig:language>
        <padig:language string="Ndebele (Zimbabwe)">nde</padig:language>
        <padig:language string="Ndonga">ndo</padig:language>
        <padig:language string="Low German">nds</padig:language>
        <padig:language string="Nepali">nep</padig:language>
        <padig:language string="Newari">new</padig:language>
        <padig:language string="Nias">nia</padig:language>
        <padig:language string="Niger-Kordofanian (Other)">nic</padig:language>
        <padig:language string="Niuean">niu</padig:language>
        <padig:language string="Norwegian (Nynorsk)">nno</padig:language>
        <padig:language string="Norwegian (Bokmal)">nob</padig:language>
        <padig:language string="Nogai">nog</padig:language>
        <padig:language string="Old Norse">non</padig:language>
        <padig:language string="Norwegian">nor</padig:language>
        <padig:language string="Northern Sotho">nso</padig:language>
        <padig:language string="Nubian languages">nub</padig:language>
        <padig:language string="Nyanja">nya</padig:language>
        <padig:language string="Nyamwezi">nym</padig:language>
        <padig:language string="Nyankole">nyn</padig:language>
        <padig:language string="Nyoro">nyo</padig:language>
        <padig:language string="Nzima">nzi</padig:language>
        <padig:language string="Occitan (post-1500)">oci</padig:language>
        <padig:language string="Ojibwa">oji</padig:language>
        <padig:language string="Oriya">ori</padig:language>
        <padig:language string="Oromo">orm</padig:language>
        <padig:language string="Osage">osa</padig:language>
        <padig:language string="Ossetic">oss</padig:language>
        <padig:language string="Turkish, Ottoman">ota</padig:language>
        <padig:language string="Otomian languages">oto</padig:language>
        <padig:language string="Papuan (Other)">paa</padig:language>
        <padig:language string="Pangasinan">pag</padig:language>
        <padig:language string="Pahlavi">pal</padig:language>
        <padig:language string="Pampanga">pam</padig:language>
        <padig:language string="Panjabi">pan</padig:language>
        <padig:language string="Papiamento">pap</padig:language>
        <padig:language string="Palauan">pau</padig:language>
        <padig:language string="Old Persian (ca. 600-400 B.C.)">peo</padig:language>
        <padig:language string="Persian">per</padig:language>
        <padig:language string="Philippine (Other)">phi</padig:language>
        <padig:language string="Phoenician">phn</padig:language>
        <padig:language string="Pali">pli</padig:language>
        <padig:language string="Polish">pol</padig:language>
        <padig:language string="Ponape">pon</padig:language>
        <padig:language string="Portuguese">por</padig:language>
        <padig:language string="Prakrit languages">pra</padig:language>
        <padig:language string="Provencal (to 1500)">pro</padig:language>
        <padig:language string="Pushto">pus</padig:language>
        <padig:language string="Quechua">que</padig:language>
        <padig:language string="Rajasthani">raj</padig:language>
        <padig:language string="Rapanui">rap</padig:language>
        <padig:language string="Rarotongan">rar</padig:language>
        <padig:language string="Romance (Other)">roa</padig:language>
        <padig:language string="Raeto-Romance">roh</padig:language>
        <padig:language string="Romani">rom</padig:language>
        <padig:language string="Romanian">rum</padig:language>
        <padig:language string="Rundi">run</padig:language>
        <padig:language string="Russian">rus</padig:language>
        <padig:language string="Sandawe">sad</padig:language>
        <padig:language string="Sango (Ubangi Creole)">sag</padig:language>
        <padig:language string="Yakut">sah</padig:language>
        <padig:language string="South American Indian (Other)">sai</padig:language>
        <padig:language string="Salishan languages">sal</padig:language>
        <padig:language string="Samaritan Aramaic">sam</padig:language>
        <padig:language string="Sanskrit">san</padig:language>
        <padig:language string="Samoan">sao</padig:language>
        <padig:language string="Sasak">sas</padig:language>
        <padig:language string="Santali">sat</padig:language>
        <padig:language string="Serbian">scc</padig:language>
        <padig:language string="Scots">sco</padig:language>
        <padig:language string="Croatian">scr</padig:language>
        <padig:language string="Selkup">sel</padig:language>
        <padig:language string="Semitic (Other)">sem</padig:language>
        <padig:language string="Irish, Old (to 1100)">sga</padig:language>
        <padig:language string="Sign languages">sgn</padig:language>
        <padig:language string="Shan">shn</padig:language>
        <padig:language string="Shona">sho</padig:language>
        <padig:language string="Sidamo">sid</padig:language>
        <padig:language string="Sinhalese">sin</padig:language>
        <padig:language string="Siouan (Other)">sio</padig:language>
        <padig:language string="Sino-Tibetan (Other)">sit</padig:language>
        <padig:language string="Slavic (Other)">sla</padig:language>
        <padig:language string="Slovak">slo</padig:language>
        <padig:language string="Slovenian">slv</padig:language>
        <padig:language string="Southern Sami">sma</padig:language>
        <padig:language string="Northern Sami">sme</padig:language>
        <padig:language string="Sami">smi</padig:language>
        <padig:language string="Lule Sami">smj</padig:language>
        <padig:language string="Inari Sami">smn</padig:language>
        <padig:language string="Samoan">smo</padig:language>
        <padig:language string="Skolt Sami">sms</padig:language>
        <padig:language string="Shona">sna</padig:language>
        <padig:language string="Sindhi">snd</padig:language>
        <padig:language string="Sinhalese">snh</padig:language>
        <padig:language string="Soninke">snk</padig:language>
        <padig:language string="Sogdian">sog</padig:language>
        <padig:language string="Somali">som</padig:language>
        <padig:language string="Songhai">son</padig:language>
        <padig:language string="Sotho">sot</padig:language>
        <padig:language string="Spanish">spa</padig:language>
        <padig:language string="Sardinian">srd</padig:language>
        <padig:language string="Serer">srr</padig:language>
        <padig:language string="Nilo-Saharan (Other)">ssa</padig:language>
        <padig:language string="Sotho">sso</padig:language>
        <padig:language string="Swazi">ssw</padig:language>
        <padig:language string="Sukuma">suk</padig:language>
        <padig:language string="Sundanese">sun</padig:language>
        <padig:language string="Susu">sus</padig:language>
        <padig:language string="Sumerian">sux</padig:language>
        <padig:language string="Swahili">swa</padig:language>
        <padig:language string="Swedish">swe</padig:language>
        <padig:language string="Swazi">swz</padig:language>
        <padig:language string="Syriac">syr</padig:language>
        <padig:language string="Tagalog">tag</padig:language>
        <padig:language string="Tahitian">tah</padig:language>
        <padig:language string="Tai (Other)">tai</padig:language>
        <padig:language string="Tajik">taj</padig:language>
        <padig:language string="Tamil">tam</padig:language>
        <padig:language string="Tatar">tar</padig:language>
        <padig:language string="Tatar">tat</padig:language>
        <padig:language string="Telugu">tel</padig:language>
        <padig:language string="Temne">tem</padig:language>
        <padig:language string="Terena">ter</padig:language>
        <padig:language string="Tetum">tet</padig:language>
        <padig:language string="Tajik">tgk</padig:language>
        <padig:language string="Tagalog">tgl</padig:language>
        <padig:language string="Thai">tha</padig:language>
        <padig:language string="Tibetan">tib</padig:language>
        <padig:language string="Tigre">tig</padig:language>
        <padig:language string="Tigrinya">tir</padig:language>
        <padig:language string="Tiv">tiv</padig:language>
        <padig:language string="Tokelauan">tkl</padig:language>
        <padig:language string="Tlingit">tli</padig:language>
        <padig:language string="Tamashek">tmh</padig:language>
        <padig:language string="Tonga (Nyasa)">tog</padig:language>
        <padig:language string="Tongan">ton</padig:language>
        <padig:language string="Tok Pisin">tpi</padig:language>
        <padig:language string="Truk">tru</padig:language>
        <padig:language string="Tsimshian">tsi</padig:language>
        <padig:language string="Tswana">tsn</padig:language>
        <padig:language string="Tsonga">tso</padig:language>
        <padig:language string="Tswana">tsw</padig:language>
        <padig:language string="Turkmen">tuk</padig:language>
        <padig:language string="Tumbuka">tum</padig:language>
        <padig:language string="Tupi languages">tup</padig:language>
        <padig:language string="Turkish">tur</padig:language>
        <padig:language string="Altaic (Other)">tut</padig:language>
        <padig:language string="Tuvaluan">tvl</padig:language>
        <padig:language string="Twi">twi</padig:language>
        <padig:language string="Tuvinian">tyv</padig:language>
        <padig:language string="Udmurt">udm</padig:language>
        <padig:language string="Ugaritic">uga</padig:language>
        <padig:language string="Uighur">uig</padig:language>
        <padig:language string="Ukrainian">ukr</padig:language>
        <padig:language string="Umbundu">umb</padig:language>
        <padig:language string="Undetermined">und</padig:language>
        <padig:language string="Urdu">urd</padig:language>
        <padig:language string="Uzbek">uzb</padig:language>
        <padig:language string="Vai">vai</padig:language>
        <padig:language string="Venda">ven</padig:language>
        <padig:language string="Vietnamese">vie</padig:language>
        <padig:language string="Volapuk">vol</padig:language>
        <padig:language string="Votic">vot</padig:language>
        <padig:language string="Wakashan languages">wak</padig:language>
        <padig:language string="Walamo">wal</padig:language>
        <padig:language string="Waray">war</padig:language>
        <padig:language string="Washo">was</padig:language>
        <padig:language string="Welsh">wel</padig:language>
        <padig:language string="Sorbian languages">wen</padig:language>
        <padig:language string="Walloon">wln</padig:language>
        <padig:language string="Wolof">wol</padig:language>
        <padig:language string="Kalmyk">xal</padig:language>
        <padig:language string="Xhosa">xho</padig:language>
        <padig:language string="Yao (Africa)">yao</padig:language>
        <padig:language string="Yapese">yap</padig:language>
        <padig:language string="Yiddish">yid</padig:language>
        <padig:language string="Yoruba">yor</padig:language>
        <padig:language string="Yupik languages">ypk</padig:language>
        <padig:language string="Zapotec">zap</padig:language>
        <padig:language string="Zenaga">zen</padig:language>
        <padig:language string="Zhuang">zha</padig:language>
        <padig:language string="Zande">znd</padig:language>
        <padig:language string="Zulu">zul</padig:language>
        <padig:language string="Zuni">zun</padig:language>
        <!-- ISO 693-2 lookup -->
        <padig:language string="Afar">aa</padig:language>
        <padig:language string="Abkhazian">ab</padig:language>
        <padig:language string="Avestan">ae</padig:language>
        <padig:language string="Afrikaans">af</padig:language>
        <padig:language string="Akan">ak</padig:language>
        <padig:language string="Amharic">am</padig:language>
        <padig:language string="Aragonese">an</padig:language>
        <padig:language string="Arabic">ar</padig:language>
        <padig:language string="Assamese">as</padig:language>
        <padig:language string="Avaric">av</padig:language>
        <padig:language string="Aymara">ay</padig:language>
        <padig:language string="Azerbaijani">az</padig:language>
        <padig:language string="Bashkir">ba</padig:language>
        <padig:language string="Belarusian">be</padig:language>
        <padig:language string="Bulgarian">bg</padig:language>
        <padig:language string="Bihari languages">bh</padig:language>
        <padig:language string="Bislama">bi</padig:language>
        <padig:language string="Bambara">bm</padig:language>
        <padig:language string="Bengali">bn</padig:language>
        <padig:language string="Tibetan">bo</padig:language>
        <padig:language string="Breton">br</padig:language>
        <padig:language string="Bosnian">bs</padig:language>
        <padig:language string="Catalan, Valencian">ca</padig:language>
        <padig:language string="Chechen">ce</padig:language>
        <padig:language string="Chamorro">ch</padig:language>
        <padig:language string="Corsican">co</padig:language>
        <padig:language string="Cree">cr</padig:language>
        <padig:language string="Czech">cs</padig:language>
        <padig:language string="Church Slavic, Old Slavonic, Church Slavonic, Old Bulgarian, Old Church Slavonic">cu</padig:language>
        <padig:language string="Chuvash">cv</padig:language>
        <padig:language string="Welsh">cy</padig:language>
        <padig:language string="Danish">da</padig:language>
        <padig:language string="German">de</padig:language>
        <padig:language string="Divehi, Dhivehi, Maldivian">dv</padig:language>
        <padig:language string="Dzongkha">dz</padig:language>
        <padig:language string="Ewe">ee</padig:language>
        <padig:language string="Greek, Modern (1453-)">el</padig:language>
        <padig:language string="English">en</padig:language>
        <padig:language string="Esperanto">eo</padig:language>
        <padig:language string="Spanish, Castilian">es</padig:language>
        <padig:language string="Estonian">et</padig:language>
        <padig:language string="Basque">eu</padig:language>
        <padig:language string="Persian">fa</padig:language>
        <padig:language string="Fulah">ff</padig:language>
        <padig:language string="Finnish">fi</padig:language>
        <padig:language string="Fijian">fj</padig:language>
        <padig:language string="Faroese">fo</padig:language>
        <padig:language string="French">fr</padig:language>
        <padig:language string="Western Frisian">fy</padig:language>
        <padig:language string="Irish">ga</padig:language>
        <padig:language string="Gaelic, Scottish Gaelic">gd</padig:language>
        <padig:language string="Galician">gl</padig:language>
        <padig:language string="Guarani">gn</padig:language>
        <padig:language string="Gujarati">gu</padig:language>
        <padig:language string="Manx">gv</padig:language>
        <padig:language string="Hausa">ha</padig:language>
        <padig:language string="Hebrew">he</padig:language>
        <padig:language string="Hindi">hi</padig:language>
        <padig:language string="Hiri Motu">ho</padig:language>
        <padig:language string="Croatian">hr</padig:language>
        <padig:language string="Haitian, Haitian Creole">ht</padig:language>
        <padig:language string="Hungarian">hu</padig:language>
        <padig:language string="Armenian">hy</padig:language>
        <padig:language string="Herero">hz</padig:language>
        <padig:language string="Interlingua (International Auxiliary Language Association)">ia</padig:language>
        <padig:language string="Indonesian">id</padig:language>
        <padig:language string="Interlingue, Occidental">ie</padig:language>
        <padig:language string="Igbo">ig</padig:language>
        <padig:language string="Sichuan Yi, Nuosu">ii</padig:language>
        <padig:language string="Inupiaq">ik</padig:language>
        <padig:language string="Ido">io</padig:language>
        <padig:language string="Icelandic">is</padig:language>
        <padig:language string="Italian">it</padig:language>
        <padig:language string="Inuktitut">iu</padig:language>
        <padig:language string="Japanese">ja</padig:language>
        <padig:language string="Javanese">jv</padig:language>
        <padig:language string="Georgian">ka</padig:language>
        <padig:language string="Kongo">kg</padig:language>
        <padig:language string="Kikuyu, Gikuyu">ki</padig:language>
        <padig:language string="Kuanyama, Kwanyama">kj</padig:language>
        <padig:language string="Kazakh">kk</padig:language>
        <padig:language string="Kalaallisut, Greenlandic">kl</padig:language>
        <padig:language string="Central Khmer">km</padig:language>
        <padig:language string="Kannada">kn</padig:language>
        <padig:language string="Korean">ko</padig:language>
        <padig:language string="Kanuri">kr</padig:language>
        <padig:language string="Kashmiri">ks</padig:language>
        <padig:language string="Kurdish">ku</padig:language>
        <padig:language string="Komi">kv</padig:language>
        <padig:language string="Cornish">kw</padig:language>
        <padig:language string="Kirghiz, Kyrgyz">ky</padig:language>
        <padig:language string="Latin">la</padig:language>
        <padig:language string="Luxembourgish, Letzeburgesch">lb</padig:language>
        <padig:language string="Ganda">lg</padig:language>
        <padig:language string="Limburgan, Limburger, Limburgish">li</padig:language>
        <padig:language string="Lingala">ln</padig:language>
        <padig:language string="Lao">lo</padig:language>
        <padig:language string="Lithuanian">lt</padig:language>
        <padig:language string="Luba-Katanga">lu</padig:language>
        <padig:language string="Latvian">lv</padig:language>
        <padig:language string="Malagasy">mg</padig:language>
        <padig:language string="Marshallese">mh</padig:language>
        <padig:language string="Maori">mi</padig:language>
        <padig:language string="Macedonian">mk</padig:language>
        <padig:language string="Malayalam">ml</padig:language>
        <padig:language string="Mongolian">mn</padig:language>
        <padig:language string="Marathi">mr</padig:language>
        <padig:language string="Malay">ms</padig:language>
        <padig:language string="Maltese">mt</padig:language>
        <padig:language string="Burmese">my</padig:language>
        <padig:language string="Nauru">na</padig:language>
        <padig:language string="Bokmål, Norwegian, Norwegian Bokmål">nb</padig:language>
        <padig:language string="Ndebele, North, North Ndebele">nd</padig:language>
        <padig:language string="Nepali">ne</padig:language>
        <padig:language string="Ndonga">ng</padig:language>
        <padig:language string="Dutch, Flemish">nl</padig:language>
        <padig:language string="Norwegian Nynorsk, Nynorsk, Norwegian">nn</padig:language>
        <padig:language string="Norwegian">no</padig:language>
        <padig:language string="Ndebele, South, South Ndebele">nr</padig:language>
        <padig:language string="Navajo, Navaho">nv</padig:language>
        <padig:language string="Chichewa, Chewa, Nyanja">ny</padig:language>
        <padig:language string="Occitan (post 1500)">oc</padig:language>
        <padig:language string="Ojibwa">oj</padig:language>
        <padig:language string="Oromo">om</padig:language>
        <padig:language string="Oriya">or</padig:language>
        <padig:language string="Ossetian, Ossetic">os</padig:language>
        <padig:language string="Panjabi, Punjabi">pa</padig:language>
        <padig:language string="Pali">pi</padig:language>
        <padig:language string="Polish">pl</padig:language>
        <padig:language string="Pushto, Pashto">ps</padig:language>
        <padig:language string="Portuguese">pt</padig:language>
        <padig:language string="Quechua">qu</padig:language>
        <padig:language string="Romansh">rm</padig:language>
        <padig:language string="Rundi">rn</padig:language>
        <padig:language string="Romanian, Moldavian, Moldovan">ro</padig:language>
        <padig:language string="Russian">ru</padig:language>
        <padig:language string="Kinyarwanda">rw</padig:language>
        <padig:language string="Sanskrit">sa</padig:language>
        <padig:language string="Sardinian">sc</padig:language>
        <padig:language string="Sindhi">sd</padig:language>
        <padig:language string="Northern Sami">se</padig:language>
        <padig:language string="Sango">sg</padig:language>
        <padig:language string="Sinhala, Sinhalese">si</padig:language>
        <padig:language string="Slovak">sk</padig:language>
        <padig:language string="Slovenian">sl</padig:language>
        <padig:language string="Samoan">sm</padig:language>
        <padig:language string="Shona">sn</padig:language>
        <padig:language string="Somali">so</padig:language>
        <padig:language string="Albanian">sq</padig:language>
        <padig:language string="Serbian">sr</padig:language>
        <padig:language string="Swati">ss</padig:language>
        <padig:language string="Sotho, Southern">st</padig:language>
        <padig:language string="Sundanese">su</padig:language>
        <padig:language string="Swedish">sv</padig:language>
        <padig:language string="Swahili">sw</padig:language>
        <padig:language string="Tamil">ta</padig:language>
        <padig:language string="Telugu">te</padig:language>
        <padig:language string="Tajik">tg</padig:language>
        <padig:language string="Thai">th</padig:language>
        <padig:language string="Tigrinya">ti</padig:language>
        <padig:language string="Turkmen">tk</padig:language>
        <padig:language string="Tagalog">tl</padig:language>
        <padig:language string="Tswana">tn</padig:language>
        <padig:language string="Tonga (Tonga Islands)">to</padig:language>
        <padig:language string="Turkish">tr</padig:language>
        <padig:language string="Tsonga">ts</padig:language>
        <padig:language string="Tatar">tt</padig:language>
        <padig:language string="Twi">tw</padig:language>
        <padig:language string="Tahitian">ty</padig:language>
        <padig:language string="Uighur, Uyghur">ug</padig:language>
        <padig:language string="Ukrainian">uk</padig:language>
        <padig:language string="Urdu">ur</padig:language>
        <padig:language string="Uzbek">uz</padig:language>
        <padig:language string="Venda">ve</padig:language>
        <padig:language string="Vietnamese">vi</padig:language>
        <padig:language string="Volapük">vo</padig:language>
        <padig:language string="Walloon">wa</padig:language>
        <padig:language string="Wolof">wo</padig:language>
        <padig:language string="Xhosa">xh</padig:language>
        <padig:language string="Yiddish">yi</padig:language>
        <padig:language string="Yoruba">yo</padig:language>
        <padig:language string="Zhuang, Chuang">za</padig:language>
        <padig:language string="Chinese">zh</padig:language>
        <padig:language string="Zulu">zu</padig:language>
    </xsl:param>

    <!-- lookup table for recommended Lexvo Languages terms/URIs -->
    <xsl:param name="lexvoLang">
        <padig:lexlanguage string="aar" uri="http://lexvo.org/id/iso639-3/aar">aar</padig:lexlanguage>
        <padig:lexlanguage string="abk" uri="http://lexvo.org/id/iso639-3/abk">abk</padig:lexlanguage>
        <padig:lexlanguage string="ace" uri="http://lexvo.org/id/iso639-3/ace">ace</padig:lexlanguage>
        <padig:lexlanguage string="ach" uri="http://lexvo.org/id/iso639-3/ach">ach</padig:lexlanguage>
        <padig:lexlanguage string="ada" uri="http://lexvo.org/id/iso639-3/ada">ada</padig:lexlanguage>
        <padig:lexlanguage string="ady" uri="http://lexvo.org/id/iso639-3/ady">ady</padig:lexlanguage>
        <padig:lexlanguage string="afa" uri="http://lexvo.org/id/iso639-5/afa">afa</padig:lexlanguage>
        <padig:lexlanguage string="afh" uri="http://lexvo.org/id/iso639-3/afh">afh</padig:lexlanguage>
        <padig:lexlanguage string="afr" uri="http://lexvo.org/id/iso639-3/afr">afr</padig:lexlanguage>
        <padig:lexlanguage string="ain" uri="http://lexvo.org/id/iso639-3/ain">ain</padig:lexlanguage>
        <padig:lexlanguage string="aka" uri="http://lexvo.org/id/iso639-3/aka">aka</padig:lexlanguage>
        <padig:lexlanguage string="akk" uri="http://lexvo.org/id/iso639-3/akk">akk</padig:lexlanguage>
        <padig:lexlanguage string="alb" uri="http://lexvo.org/id/iso639-3/sqi">alb</padig:lexlanguage>
        <padig:lexlanguage string="ale" uri="http://lexvo.org/id/iso639-3/ale">ale</padig:lexlanguage>
        <padig:lexlanguage string="alg" uri="http://lexvo.org/id/iso639-5/alg">alg</padig:lexlanguage>
        <padig:lexlanguage string="alt" uri="http://lexvo.org/id/iso639-3/alt">alt</padig:lexlanguage>
        <padig:lexlanguage string="amh" uri="http://lexvo.org/id/iso639-3/amh">amh</padig:lexlanguage>
        <padig:lexlanguage string="ang" uri="http://lexvo.org/id/iso639-3/ang">ang</padig:lexlanguage>
        <padig:lexlanguage string="anp" uri="http://lexvo.org/id/iso639-3/anp">anp</padig:lexlanguage>
        <padig:lexlanguage string="apa" uri="http://lexvo.org/id/iso639-5/apa">apa</padig:lexlanguage>
        <padig:lexlanguage string="ara" uri="http://lexvo.org/id/iso639-3/ara">ara</padig:lexlanguage>
        <padig:lexlanguage string="arc" uri="http://lexvo.org/id/iso639-3/arc">arc</padig:lexlanguage>
        <padig:lexlanguage string="arg" uri="http://lexvo.org/id/iso639-3/arg">arg</padig:lexlanguage>
        <padig:lexlanguage string="arm" uri="http://lexvo.org/id/iso639-3/hye">arm</padig:lexlanguage>
        <padig:lexlanguage string="arn" uri="http://lexvo.org/id/iso639-3/arn">arn</padig:lexlanguage>
        <padig:lexlanguage string="arp" uri="http://lexvo.org/id/iso639-3/arp">arp</padig:lexlanguage>
        <padig:lexlanguage string="art" uri="http://lexvo.org/id/iso639-5/art">art</padig:lexlanguage>
        <padig:lexlanguage string="arw" uri="http://lexvo.org/id/iso639-3/arw">arw</padig:lexlanguage>
        <padig:lexlanguage string="asm" uri="http://lexvo.org/id/iso639-3/asm">asm</padig:lexlanguage>
        <padig:lexlanguage string="ast" uri="http://lexvo.org/id/iso639-3/ast">ast</padig:lexlanguage>
        <padig:lexlanguage string="ath" uri="http://lexvo.org/id/iso639-5/ath">ath</padig:lexlanguage>
        <padig:lexlanguage string="aus" uri="http://lexvo.org/id/iso639-5/aus">aus</padig:lexlanguage>
        <padig:lexlanguage string="ava" uri="http://lexvo.org/id/iso639-3/ava">ava</padig:lexlanguage>
        <padig:lexlanguage string="ave" uri="http://lexvo.org/id/iso639-3/ave">ave</padig:lexlanguage>
        <padig:lexlanguage string="awa" uri="http://lexvo.org/id/iso639-3/awa">awa</padig:lexlanguage>
        <padig:lexlanguage string="aym" uri="http://lexvo.org/id/iso639-3/aym">aym</padig:lexlanguage>
        <padig:lexlanguage string="aze" uri="http://lexvo.org/id/iso639-3/aze">aze</padig:lexlanguage>
        <padig:lexlanguage string="bad" uri="http://lexvo.org/id/iso639-5/bad">bad</padig:lexlanguage>
        <padig:lexlanguage string="bai" uri="http://lexvo.org/id/iso639-5/bai">bai</padig:lexlanguage>
        <padig:lexlanguage string="bak" uri="http://lexvo.org/id/iso639-3/bak">bak</padig:lexlanguage>
        <padig:lexlanguage string="bal" uri="http://lexvo.org/id/iso639-3/bal">bal</padig:lexlanguage>
        <padig:lexlanguage string="bam" uri="http://lexvo.org/id/iso639-3/bam">bam</padig:lexlanguage>
        <padig:lexlanguage string="ban" uri="http://lexvo.org/id/iso639-3/ban">ban</padig:lexlanguage>
        <padig:lexlanguage string="baq" uri="http://lexvo.org/id/iso639-3/eus">baq</padig:lexlanguage>
        <padig:lexlanguage string="bas" uri="http://lexvo.org/id/iso639-3/bas">bas</padig:lexlanguage>
        <padig:lexlanguage string="bat" uri="http://lexvo.org/id/iso639-5/bat">bat</padig:lexlanguage>
        <padig:lexlanguage string="bej" uri="http://lexvo.org/id/iso639-3/bej">bej</padig:lexlanguage>
        <padig:lexlanguage string="bel" uri="http://lexvo.org/id/iso639-3/bel">bel</padig:lexlanguage>
        <padig:lexlanguage string="bem" uri="http://lexvo.org/id/iso639-3/bem">bem</padig:lexlanguage>
        <padig:lexlanguage string="ben" uri="http://lexvo.org/id/iso639-3/ben">ben</padig:lexlanguage>
        <padig:lexlanguage string="ber" uri="http://lexvo.org/id/iso639-5/ber">ber</padig:lexlanguage>
        <padig:lexlanguage string="bho" uri="http://lexvo.org/id/iso639-3/bho">bho</padig:lexlanguage>
        <padig:lexlanguage string="bik" uri="http://lexvo.org/id/iso639-3/bik">bik</padig:lexlanguage>
        <padig:lexlanguage string="bin" uri="http://lexvo.org/id/iso639-3/bin">bin</padig:lexlanguage>
        <padig:lexlanguage string="bis" uri="http://lexvo.org/id/iso639-3/bis">bis</padig:lexlanguage>
        <padig:lexlanguage string="bla" uri="http://lexvo.org/id/iso639-3/bla">bla</padig:lexlanguage>
        <padig:lexlanguage string="bnt" uri="http://lexvo.org/id/iso639-5/bnt">bnt</padig:lexlanguage>
        <padig:lexlanguage string="bod" uri="http://lexvo.org/id/iso639-3/bod">bod</padig:lexlanguage>
        <padig:lexlanguage string="bos" uri="http://lexvo.org/id/iso639-3/bos">bos</padig:lexlanguage>
        <padig:lexlanguage string="bra" uri="http://lexvo.org/id/iso639-3/bra">bra</padig:lexlanguage>
        <padig:lexlanguage string="bre" uri="http://lexvo.org/id/iso639-3/bre">bre</padig:lexlanguage>
        <padig:lexlanguage string="btk" uri="http://lexvo.org/id/iso639-5/btk">btk</padig:lexlanguage>
        <padig:lexlanguage string="bua" uri="http://lexvo.org/id/iso639-3/bua">bua</padig:lexlanguage>
        <padig:lexlanguage string="bug" uri="http://lexvo.org/id/iso639-3/bug">bug</padig:lexlanguage>
        <padig:lexlanguage string="bul" uri="http://lexvo.org/id/iso639-3/bul">bul</padig:lexlanguage>
        <padig:lexlanguage string="bur" uri="http://lexvo.org/id/iso639-3/mya">bur</padig:lexlanguage>
        <padig:lexlanguage string="byn" uri="http://lexvo.org/id/iso639-3/byn">byn</padig:lexlanguage>
        <padig:lexlanguage string="cad" uri="http://lexvo.org/id/iso639-3/cad">cad</padig:lexlanguage>
        <padig:lexlanguage string="cai" uri="http://lexvo.org/id/iso639-5/cai">cai</padig:lexlanguage>
        <padig:lexlanguage string="car" uri="http://lexvo.org/id/iso639-3/car">car</padig:lexlanguage>
        <padig:lexlanguage string="cat" uri="http://lexvo.org/id/iso639-3/cat">cat</padig:lexlanguage>
        <padig:lexlanguage string="cau" uri="http://lexvo.org/id/iso639-5/cau">cau</padig:lexlanguage>
        <padig:lexlanguage string="ceb" uri="http://lexvo.org/id/iso639-3/ceb">ceb</padig:lexlanguage>
        <padig:lexlanguage string="cel" uri="http://lexvo.org/id/iso639-5/cel">cel</padig:lexlanguage>
        <padig:lexlanguage string="ces" uri="http://lexvo.org/id/iso639-3/ces">ces</padig:lexlanguage>
        <padig:lexlanguage string="cha" uri="http://lexvo.org/id/iso639-3/cha">cha</padig:lexlanguage>
        <padig:lexlanguage string="chb" uri="http://lexvo.org/id/iso639-3/chb">chb</padig:lexlanguage>
        <padig:lexlanguage string="che" uri="http://lexvo.org/id/iso639-3/che">che</padig:lexlanguage>
        <padig:lexlanguage string="chg" uri="http://lexvo.org/id/iso639-3/chg">chg</padig:lexlanguage>
        <padig:lexlanguage string="chi" uri="http://lexvo.org/id/iso639-3/zho">chi</padig:lexlanguage>
        <padig:lexlanguage string="chk" uri="http://lexvo.org/id/iso639-3/chk">chk</padig:lexlanguage>
        <padig:lexlanguage string="chm" uri="http://lexvo.org/id/iso639-3/chm">chm</padig:lexlanguage>
        <padig:lexlanguage string="chn" uri="http://lexvo.org/id/iso639-3/chn">chn</padig:lexlanguage>
        <padig:lexlanguage string="cho" uri="http://lexvo.org/id/iso639-3/cho">cho</padig:lexlanguage>
        <padig:lexlanguage string="chp" uri="http://lexvo.org/id/iso639-3/chp">chp</padig:lexlanguage>
        <padig:lexlanguage string="chr" uri="http://lexvo.org/id/iso639-3/chr">chr</padig:lexlanguage>
        <padig:lexlanguage string="chu" uri="http://lexvo.org/id/iso639-3/chu">chu</padig:lexlanguage>
        <padig:lexlanguage string="chv" uri="http://lexvo.org/id/iso639-3/chv">chv</padig:lexlanguage>
        <padig:lexlanguage string="chy" uri="http://lexvo.org/id/iso639-3/chy">chy</padig:lexlanguage>
        <padig:lexlanguage string="cmc" uri="http://lexvo.org/id/iso639-5/cmc">cmc</padig:lexlanguage>
        <padig:lexlanguage string="cop" uri="http://lexvo.org/id/iso639-3/cop">cop</padig:lexlanguage>
        <padig:lexlanguage string="cor" uri="http://lexvo.org/id/iso639-3/cor">cor</padig:lexlanguage>
        <padig:lexlanguage string="cos" uri="http://lexvo.org/id/iso639-3/cos">cos</padig:lexlanguage>
        <padig:lexlanguage string="cpe" uri="http://lexvo.org/id/iso639-5/cpe">cpe</padig:lexlanguage>
        <padig:lexlanguage string="cpf" uri="http://lexvo.org/id/iso639-5/cpf">cpf</padig:lexlanguage>
        <padig:lexlanguage string="cpp" uri="http://lexvo.org/id/iso639-5/cpp">cpp</padig:lexlanguage>
        <padig:lexlanguage string="cre" uri="http://lexvo.org/id/iso639-3/cre">cre</padig:lexlanguage>
        <padig:lexlanguage string="crh" uri="http://lexvo.org/id/iso639-3/crh">crh</padig:lexlanguage>
        <padig:lexlanguage string="crp" uri="http://lexvo.org/id/iso639-5/crp">crp</padig:lexlanguage>
        <padig:lexlanguage string="csb" uri="http://lexvo.org/id/iso639-3/csb">csb</padig:lexlanguage>
        <padig:lexlanguage string="cus" uri="http://lexvo.org/id/iso639-5/cus">cus</padig:lexlanguage>
        <padig:lexlanguage string="cym" uri="http://lexvo.org/id/iso639-3/cym">cym</padig:lexlanguage>
        <padig:lexlanguage string="cze" uri="http://lexvo.org/id/iso639-3/ces">cze</padig:lexlanguage>
        <padig:lexlanguage string="dak" uri="http://lexvo.org/id/iso639-3/dak">dak</padig:lexlanguage>
        <padig:lexlanguage string="dan" uri="http://lexvo.org/id/iso639-3/dan">dan</padig:lexlanguage>
        <padig:lexlanguage string="dar" uri="http://lexvo.org/id/iso639-3/dar">dar</padig:lexlanguage>
        <padig:lexlanguage string="day" uri="http://lexvo.org/id/iso639-5/day">day</padig:lexlanguage>
        <padig:lexlanguage string="del" uri="http://lexvo.org/id/iso639-3/del">del</padig:lexlanguage>
        <padig:lexlanguage string="den" uri="http://lexvo.org/id/iso639-3/den">den</padig:lexlanguage>
        <padig:lexlanguage string="deu" uri="http://lexvo.org/id/iso639-3/deu">deu</padig:lexlanguage>
        <padig:lexlanguage string="dgr" uri="http://lexvo.org/id/iso639-3/dgr">dgr</padig:lexlanguage>
        <padig:lexlanguage string="din" uri="http://lexvo.org/id/iso639-3/din">din</padig:lexlanguage>
        <padig:lexlanguage string="div" uri="http://lexvo.org/id/iso639-3/div">div</padig:lexlanguage>
        <padig:lexlanguage string="doi" uri="http://lexvo.org/id/iso639-3/doi">doi</padig:lexlanguage>
        <padig:lexlanguage string="dra" uri="http://lexvo.org/id/iso639-5/dra">dra</padig:lexlanguage>
        <padig:lexlanguage string="dsb" uri="http://lexvo.org/id/iso639-3/dsb">dsb</padig:lexlanguage>
        <padig:lexlanguage string="dua" uri="http://lexvo.org/id/iso639-3/dua">dua</padig:lexlanguage>
        <padig:lexlanguage string="dum" uri="http://lexvo.org/id/iso639-3/dum">dum</padig:lexlanguage>
        <padig:lexlanguage string="dut" uri="http://lexvo.org/id/iso639-3/nld">dut</padig:lexlanguage>
        <padig:lexlanguage string="dyu" uri="http://lexvo.org/id/iso639-3/dyu">dyu</padig:lexlanguage>
        <padig:lexlanguage string="dzo" uri="http://lexvo.org/id/iso639-3/dzo">dzo</padig:lexlanguage>
        <padig:lexlanguage string="efi" uri="http://lexvo.org/id/iso639-3/efi">efi</padig:lexlanguage>
        <padig:lexlanguage string="egy" uri="http://lexvo.org/id/iso639-3/egy">egy</padig:lexlanguage>
        <padig:lexlanguage string="eka" uri="http://lexvo.org/id/iso639-3/eka">eka</padig:lexlanguage>
        <padig:lexlanguage string="ell" uri="http://lexvo.org/id/iso639-3/ell">ell</padig:lexlanguage>
        <padig:lexlanguage string="elx" uri="http://lexvo.org/id/iso639-3/elx">elx</padig:lexlanguage>
        <padig:lexlanguage string="eng" uri="http://lexvo.org/id/iso639-3/eng">eng</padig:lexlanguage>
        <padig:lexlanguage string="enm" uri="http://lexvo.org/id/iso639-3/enm">enm</padig:lexlanguage>
        <padig:lexlanguage string="epo" uri="http://lexvo.org/id/iso639-3/epo">epo</padig:lexlanguage>
        <padig:lexlanguage string="est" uri="http://lexvo.org/id/iso639-3/est">est</padig:lexlanguage>
        <padig:lexlanguage string="eus" uri="http://lexvo.org/id/iso639-3/eus">eus</padig:lexlanguage>
        <padig:lexlanguage string="ewe" uri="http://lexvo.org/id/iso639-3/ewe">ewe</padig:lexlanguage>
        <padig:lexlanguage string="ewo" uri="http://lexvo.org/id/iso639-3/ewo">ewo</padig:lexlanguage>
        <padig:lexlanguage string="fan" uri="http://lexvo.org/id/iso639-3/fan">fan</padig:lexlanguage>
        <padig:lexlanguage string="fao" uri="http://lexvo.org/id/iso639-3/fao">fao</padig:lexlanguage>
        <padig:lexlanguage string="fas" uri="http://lexvo.org/id/iso639-3/fas">fas</padig:lexlanguage>
        <padig:lexlanguage string="fat" uri="http://lexvo.org/id/iso639-3/fat">fat</padig:lexlanguage>
        <padig:lexlanguage string="fij" uri="http://lexvo.org/id/iso639-3/fij">fij</padig:lexlanguage>
        <padig:lexlanguage string="fil" uri="http://lexvo.org/id/iso639-3/fil">fil</padig:lexlanguage>
        <padig:lexlanguage string="fin" uri="http://lexvo.org/id/iso639-3/fin">fin</padig:lexlanguage>
        <padig:lexlanguage string="fiu" uri="http://lexvo.org/id/iso639-5/fiu">fiu</padig:lexlanguage>
        <padig:lexlanguage string="fon" uri="http://lexvo.org/id/iso639-3/fon">fon</padig:lexlanguage>
        <padig:lexlanguage string="fra" uri="http://lexvo.org/id/iso639-3/fra">fra</padig:lexlanguage>
        <padig:lexlanguage string="fre" uri="http://lexvo.org/id/iso639-3/fra">fre</padig:lexlanguage>
        <padig:lexlanguage string="frm" uri="http://lexvo.org/id/iso639-3/frm">frm</padig:lexlanguage>
        <padig:lexlanguage string="fro" uri="http://lexvo.org/id/iso639-3/fro">fro</padig:lexlanguage>
        <padig:lexlanguage string="frr" uri="http://lexvo.org/id/iso639-3/frr">frr</padig:lexlanguage>
        <padig:lexlanguage string="frs" uri="http://lexvo.org/id/iso639-3/frs">frs</padig:lexlanguage>
        <padig:lexlanguage string="fry" uri="http://lexvo.org/id/iso639-3/fry">fry</padig:lexlanguage>
        <padig:lexlanguage string="ful" uri="http://lexvo.org/id/iso639-3/ful">ful</padig:lexlanguage>
        <padig:lexlanguage string="fur" uri="http://lexvo.org/id/iso639-3/fur">fur</padig:lexlanguage>
        <padig:lexlanguage string="gaa" uri="http://lexvo.org/id/iso639-3/gaa">gaa</padig:lexlanguage>
        <padig:lexlanguage string="gay" uri="http://lexvo.org/id/iso639-3/gay">gay</padig:lexlanguage>
        <padig:lexlanguage string="gba" uri="http://lexvo.org/id/iso639-3/gba">gba</padig:lexlanguage>
        <padig:lexlanguage string="gem" uri="http://lexvo.org/id/iso639-5/gem">gem</padig:lexlanguage>
        <padig:lexlanguage string="geo" uri="http://lexvo.org/id/iso639-3/kat">geo</padig:lexlanguage>
        <padig:lexlanguage string="ger" uri="http://lexvo.org/id/iso639-3/deu">ger</padig:lexlanguage>
        <padig:lexlanguage string="gez" uri="http://lexvo.org/id/iso639-3/gez">gez</padig:lexlanguage>
        <padig:lexlanguage string="gil" uri="http://lexvo.org/id/iso639-3/gil">gil</padig:lexlanguage>
        <padig:lexlanguage string="gla" uri="http://lexvo.org/id/iso639-3/gla">gla</padig:lexlanguage>
        <padig:lexlanguage string="gle" uri="http://lexvo.org/id/iso639-3/gle">gle</padig:lexlanguage>
        <padig:lexlanguage string="glg" uri="http://lexvo.org/id/iso639-3/glg">glg</padig:lexlanguage>
        <padig:lexlanguage string="glv" uri="http://lexvo.org/id/iso639-3/glv">glv</padig:lexlanguage>
        <padig:lexlanguage string="gmh" uri="http://lexvo.org/id/iso639-3/gmh">gmh</padig:lexlanguage>
        <padig:lexlanguage string="goh" uri="http://lexvo.org/id/iso639-3/goh">goh</padig:lexlanguage>
        <padig:lexlanguage string="gon" uri="http://lexvo.org/id/iso639-3/gon">gon</padig:lexlanguage>
        <padig:lexlanguage string="gor" uri="http://lexvo.org/id/iso639-3/gor">gor</padig:lexlanguage>
        <padig:lexlanguage string="got" uri="http://lexvo.org/id/iso639-3/got">got</padig:lexlanguage>
        <padig:lexlanguage string="grb" uri="http://lexvo.org/id/iso639-3/grb">grb</padig:lexlanguage>
        <padig:lexlanguage string="grc" uri="http://lexvo.org/id/iso639-3/grc">grc</padig:lexlanguage>
        <padig:lexlanguage string="gre" uri="http://lexvo.org/id/iso639-3/ell">gre</padig:lexlanguage>
        <padig:lexlanguage string="grn" uri="http://lexvo.org/id/iso639-3/grn">grn</padig:lexlanguage>
        <padig:lexlanguage string="gsw" uri="http://lexvo.org/id/iso639-3/gsw">gsw</padig:lexlanguage>
        <padig:lexlanguage string="guj" uri="http://lexvo.org/id/iso639-3/guj">guj</padig:lexlanguage>
        <padig:lexlanguage string="gwi" uri="http://lexvo.org/id/iso639-3/gwi">gwi</padig:lexlanguage>
        <padig:lexlanguage string="hai" uri="http://lexvo.org/id/iso639-3/hai">hai</padig:lexlanguage>
        <padig:lexlanguage string="hat" uri="http://lexvo.org/id/iso639-3/hat">hat</padig:lexlanguage>
        <padig:lexlanguage string="hau" uri="http://lexvo.org/id/iso639-3/hau">hau</padig:lexlanguage>
        <padig:lexlanguage string="haw" uri="http://lexvo.org/id/iso639-3/haw">haw</padig:lexlanguage>
        <padig:lexlanguage string="heb" uri="http://lexvo.org/id/iso639-3/heb">heb</padig:lexlanguage>
        <padig:lexlanguage string="her" uri="http://lexvo.org/id/iso639-3/her">her</padig:lexlanguage>
        <padig:lexlanguage string="hil" uri="http://lexvo.org/id/iso639-3/hil">hil</padig:lexlanguage>
        <padig:lexlanguage string="hin" uri="http://lexvo.org/id/iso639-3/hin">hin</padig:lexlanguage>
        <padig:lexlanguage string="hit" uri="http://lexvo.org/id/iso639-3/hit">hit</padig:lexlanguage>
        <padig:lexlanguage string="hmn" uri="http://lexvo.org/id/iso639-3/hmn">hmn</padig:lexlanguage>
        <padig:lexlanguage string="hmo" uri="http://lexvo.org/id/iso639-3/hmo">hmo</padig:lexlanguage>
        <padig:lexlanguage string="hrv" uri="http://lexvo.org/id/iso639-3/hrv">hrv</padig:lexlanguage>
        <padig:lexlanguage string="hsb" uri="http://lexvo.org/id/iso639-3/hsb">hsb</padig:lexlanguage>
        <padig:lexlanguage string="hun" uri="http://lexvo.org/id/iso639-3/hun">hun</padig:lexlanguage>
        <padig:lexlanguage string="hup" uri="http://lexvo.org/id/iso639-3/hup">hup</padig:lexlanguage>
        <padig:lexlanguage string="hye" uri="http://lexvo.org/id/iso639-3/hye">hye</padig:lexlanguage>
        <padig:lexlanguage string="iba" uri="http://lexvo.org/id/iso639-3/iba">iba</padig:lexlanguage>
        <padig:lexlanguage string="ibo" uri="http://lexvo.org/id/iso639-3/ibo">ibo</padig:lexlanguage>
        <padig:lexlanguage string="ice" uri="http://lexvo.org/id/iso639-3/isl">ice</padig:lexlanguage>
        <padig:lexlanguage string="ido" uri="http://lexvo.org/id/iso639-3/ido">ido</padig:lexlanguage>
        <padig:lexlanguage string="iii" uri="http://lexvo.org/id/iso639-3/iii">iii</padig:lexlanguage>
        <padig:lexlanguage string="ijo" uri="http://lexvo.org/id/iso639-5/ijo">ijo</padig:lexlanguage>
        <padig:lexlanguage string="iku" uri="http://lexvo.org/id/iso639-3/iku">iku</padig:lexlanguage>
        <padig:lexlanguage string="ile" uri="http://lexvo.org/id/iso639-3/ile">ile</padig:lexlanguage>
        <padig:lexlanguage string="ilo" uri="http://lexvo.org/id/iso639-3/ilo">ilo</padig:lexlanguage>
        <padig:lexlanguage string="ina" uri="http://lexvo.org/id/iso639-3/ina">ina</padig:lexlanguage>
        <padig:lexlanguage string="inc" uri="http://lexvo.org/id/iso639-5/inc">inc</padig:lexlanguage>
        <padig:lexlanguage string="ind" uri="http://lexvo.org/id/iso639-3/ind">ind</padig:lexlanguage>
        <padig:lexlanguage string="ine" uri="http://lexvo.org/id/iso639-5/ine">ine</padig:lexlanguage>
        <padig:lexlanguage string="inh" uri="http://lexvo.org/id/iso639-3/inh">inh</padig:lexlanguage>
        <padig:lexlanguage string="ipk" uri="http://lexvo.org/id/iso639-3/ipk">ipk</padig:lexlanguage>
        <padig:lexlanguage string="ira" uri="http://lexvo.org/id/iso639-5/ira">ira</padig:lexlanguage>
        <padig:lexlanguage string="iro" uri="http://lexvo.org/id/iso639-5/iro">iro</padig:lexlanguage>
        <padig:lexlanguage string="isl" uri="http://lexvo.org/id/iso639-3/isl">isl</padig:lexlanguage>
        <padig:lexlanguage string="ita" uri="http://lexvo.org/id/iso639-3/ita">ita</padig:lexlanguage>
        <padig:lexlanguage string="jav" uri="http://lexvo.org/id/iso639-3/jav">jav</padig:lexlanguage>
        <padig:lexlanguage string="jbo" uri="http://lexvo.org/id/iso639-3/jbo">jbo</padig:lexlanguage>
        <padig:lexlanguage string="jpn" uri="http://lexvo.org/id/iso639-3/jpn">jpn</padig:lexlanguage>
        <padig:lexlanguage string="jpr" uri="http://lexvo.org/id/iso639-3/jpr">jpr</padig:lexlanguage>
        <padig:lexlanguage string="jrb" uri="http://lexvo.org/id/iso639-3/jrb">jrb</padig:lexlanguage>
        <padig:lexlanguage string="kaa" uri="http://lexvo.org/id/iso639-3/kaa">kaa</padig:lexlanguage>
        <padig:lexlanguage string="kab" uri="http://lexvo.org/id/iso639-3/kab">kab</padig:lexlanguage>
        <padig:lexlanguage string="kac" uri="http://lexvo.org/id/iso639-3/kac">kac</padig:lexlanguage>
        <padig:lexlanguage string="kal" uri="http://lexvo.org/id/iso639-3/kal">kal</padig:lexlanguage>
        <padig:lexlanguage string="kam" uri="http://lexvo.org/id/iso639-3/kam">kam</padig:lexlanguage>
        <padig:lexlanguage string="kan" uri="http://lexvo.org/id/iso639-3/kan">kan</padig:lexlanguage>
        <padig:lexlanguage string="kar" uri="http://lexvo.org/id/iso639-5/kar">kar</padig:lexlanguage>
        <padig:lexlanguage string="kas" uri="http://lexvo.org/id/iso639-3/kas">kas</padig:lexlanguage>
        <padig:lexlanguage string="kat" uri="http://lexvo.org/id/iso639-3/kat">kat</padig:lexlanguage>
        <padig:lexlanguage string="kau" uri="http://lexvo.org/id/iso639-3/kau">kau</padig:lexlanguage>
        <padig:lexlanguage string="kaw" uri="http://lexvo.org/id/iso639-3/kaw">kaw</padig:lexlanguage>
        <padig:lexlanguage string="kaz" uri="http://lexvo.org/id/iso639-3/kaz">kaz</padig:lexlanguage>
        <padig:lexlanguage string="kbd" uri="http://lexvo.org/id/iso639-3/kbd">kbd</padig:lexlanguage>
        <padig:lexlanguage string="kha" uri="http://lexvo.org/id/iso639-3/kha">kha</padig:lexlanguage>
        <padig:lexlanguage string="khi" uri="http://lexvo.org/id/iso639-5/khi">khi</padig:lexlanguage>
        <padig:lexlanguage string="khm" uri="http://lexvo.org/id/iso639-3/khm">khm</padig:lexlanguage>
        <padig:lexlanguage string="kho" uri="http://lexvo.org/id/iso639-3/kho">kho</padig:lexlanguage>
        <padig:lexlanguage string="kik" uri="http://lexvo.org/id/iso639-3/kik">kik</padig:lexlanguage>
        <padig:lexlanguage string="kin" uri="http://lexvo.org/id/iso639-3/kin">kin</padig:lexlanguage>
        <padig:lexlanguage string="kir" uri="http://lexvo.org/id/iso639-3/kir">kir</padig:lexlanguage>
        <padig:lexlanguage string="kmb" uri="http://lexvo.org/id/iso639-3/kmb">kmb</padig:lexlanguage>
        <padig:lexlanguage string="kok" uri="http://lexvo.org/id/iso639-3/kok">kok</padig:lexlanguage>
        <padig:lexlanguage string="kom" uri="http://lexvo.org/id/iso639-3/kom">kom</padig:lexlanguage>
        <padig:lexlanguage string="kon" uri="http://lexvo.org/id/iso639-3/kon">kon</padig:lexlanguage>
        <padig:lexlanguage string="kor" uri="http://lexvo.org/id/iso639-3/kor">kor</padig:lexlanguage>
        <padig:lexlanguage string="kos" uri="http://lexvo.org/id/iso639-3/kos">kos</padig:lexlanguage>
        <padig:lexlanguage string="kpe" uri="http://lexvo.org/id/iso639-3/kpe">kpe</padig:lexlanguage>
        <padig:lexlanguage string="krc" uri="http://lexvo.org/id/iso639-3/krc">krc</padig:lexlanguage>
        <padig:lexlanguage string="krl" uri="http://lexvo.org/id/iso639-3/krl">krl</padig:lexlanguage>
        <padig:lexlanguage string="kro" uri="http://lexvo.org/id/iso639-5/kro">kro</padig:lexlanguage>
        <padig:lexlanguage string="kru" uri="http://lexvo.org/id/iso639-3/kru">kru</padig:lexlanguage>
        <padig:lexlanguage string="kua" uri="http://lexvo.org/id/iso639-3/kua">kua</padig:lexlanguage>
        <padig:lexlanguage string="kum" uri="http://lexvo.org/id/iso639-3/kum">kum</padig:lexlanguage>
        <padig:lexlanguage string="kur" uri="http://lexvo.org/id/iso639-3/kur">kur</padig:lexlanguage>
        <padig:lexlanguage string="kut" uri="http://lexvo.org/id/iso639-3/kut">kut</padig:lexlanguage>
        <padig:lexlanguage string="lad" uri="http://lexvo.org/id/iso639-3/lad">lad</padig:lexlanguage>
        <padig:lexlanguage string="lah" uri="http://lexvo.org/id/iso639-3/lah">lah</padig:lexlanguage>
        <padig:lexlanguage string="lam" uri="http://lexvo.org/id/iso639-3/lam">lam</padig:lexlanguage>
        <padig:lexlanguage string="lao" uri="http://lexvo.org/id/iso639-3/lao">lao</padig:lexlanguage>
        <padig:lexlanguage string="lat" uri="http://lexvo.org/id/iso639-3/lat">lat</padig:lexlanguage>
        <padig:lexlanguage string="lav" uri="http://lexvo.org/id/iso639-3/lav">lav</padig:lexlanguage>
        <padig:lexlanguage string="lez" uri="http://lexvo.org/id/iso639-3/lez">lez</padig:lexlanguage>
        <padig:lexlanguage string="lim" uri="http://lexvo.org/id/iso639-3/lim">lim</padig:lexlanguage>
        <padig:lexlanguage string="lin" uri="http://lexvo.org/id/iso639-3/lin">lin</padig:lexlanguage>
        <padig:lexlanguage string="lit" uri="http://lexvo.org/id/iso639-3/lit">lit</padig:lexlanguage>
        <padig:lexlanguage string="lol" uri="http://lexvo.org/id/iso639-3/lol">lol</padig:lexlanguage>
        <padig:lexlanguage string="loz" uri="http://lexvo.org/id/iso639-3/loz">loz</padig:lexlanguage>
        <padig:lexlanguage string="ltz" uri="http://lexvo.org/id/iso639-3/ltz">ltz</padig:lexlanguage>
        <padig:lexlanguage string="lua" uri="http://lexvo.org/id/iso639-3/lua">lua</padig:lexlanguage>
        <padig:lexlanguage string="lub" uri="http://lexvo.org/id/iso639-3/lub">lub</padig:lexlanguage>
        <padig:lexlanguage string="lug" uri="http://lexvo.org/id/iso639-3/lug">lug</padig:lexlanguage>
        <padig:lexlanguage string="lui" uri="http://lexvo.org/id/iso639-3/lui">lui</padig:lexlanguage>
        <padig:lexlanguage string="lun" uri="http://lexvo.org/id/iso639-3/lun">lun</padig:lexlanguage>
        <padig:lexlanguage string="luo" uri="http://lexvo.org/id/iso639-3/luo">luo</padig:lexlanguage>
        <padig:lexlanguage string="lus" uri="http://lexvo.org/id/iso639-3/lus">lus</padig:lexlanguage>
        <padig:lexlanguage string="mac" uri="http://lexvo.org/id/iso639-3/mkd">mac</padig:lexlanguage>
        <padig:lexlanguage string="mad" uri="http://lexvo.org/id/iso639-3/mad">mad</padig:lexlanguage>
        <padig:lexlanguage string="mag" uri="http://lexvo.org/id/iso639-3/mag">mag</padig:lexlanguage>
        <padig:lexlanguage string="mah" uri="http://lexvo.org/id/iso639-3/mah">mah</padig:lexlanguage>
        <padig:lexlanguage string="mai" uri="http://lexvo.org/id/iso639-3/mai">mai</padig:lexlanguage>
        <padig:lexlanguage string="mak" uri="http://lexvo.org/id/iso639-3/mak">mak</padig:lexlanguage>
        <padig:lexlanguage string="mal" uri="http://lexvo.org/id/iso639-3/mal">mal</padig:lexlanguage>
        <padig:lexlanguage string="man" uri="http://lexvo.org/id/iso639-3/man">man</padig:lexlanguage>
        <padig:lexlanguage string="mao" uri="http://lexvo.org/id/iso639-3/mri">mao</padig:lexlanguage>
        <padig:lexlanguage string="map" uri="http://lexvo.org/id/iso639-5/map">map</padig:lexlanguage>
        <padig:lexlanguage string="mar" uri="http://lexvo.org/id/iso639-3/mar">mar</padig:lexlanguage>
        <padig:lexlanguage string="mas" uri="http://lexvo.org/id/iso639-3/mas">mas</padig:lexlanguage>
        <padig:lexlanguage string="may" uri="http://lexvo.org/id/iso639-3/msa">may</padig:lexlanguage>
        <padig:lexlanguage string="mdf" uri="http://lexvo.org/id/iso639-3/mdf">mdf</padig:lexlanguage>
        <padig:lexlanguage string="mdr" uri="http://lexvo.org/id/iso639-3/mdr">mdr</padig:lexlanguage>
        <padig:lexlanguage string="men" uri="http://lexvo.org/id/iso639-3/men">men</padig:lexlanguage>
        <padig:lexlanguage string="mga" uri="http://lexvo.org/id/iso639-3/mga">mga</padig:lexlanguage>
        <padig:lexlanguage string="mic" uri="http://lexvo.org/id/iso639-3/mic">mic</padig:lexlanguage>
        <padig:lexlanguage string="min" uri="http://lexvo.org/id/iso639-3/min">min</padig:lexlanguage>
        <padig:lexlanguage string="mis" uri="http://lexvo.org/id/iso639-3/mis">mis</padig:lexlanguage>
        <padig:lexlanguage string="mkd" uri="http://lexvo.org/id/iso639-3/mkd">mkd</padig:lexlanguage>
        <padig:lexlanguage string="mkh" uri="http://lexvo.org/id/iso639-5/mkh">mkh</padig:lexlanguage>
        <padig:lexlanguage string="mlg" uri="http://lexvo.org/id/iso639-3/mlg">mlg</padig:lexlanguage>
        <padig:lexlanguage string="mlt" uri="http://lexvo.org/id/iso639-3/mlt">mlt</padig:lexlanguage>
        <padig:lexlanguage string="mnc" uri="http://lexvo.org/id/iso639-3/mnc">mnc</padig:lexlanguage>
        <padig:lexlanguage string="mni" uri="http://lexvo.org/id/iso639-3/mni">mni</padig:lexlanguage>
        <padig:lexlanguage string="mno" uri="http://lexvo.org/id/iso639-5/mno">mno</padig:lexlanguage>
        <padig:lexlanguage string="moh" uri="http://lexvo.org/id/iso639-3/moh">moh</padig:lexlanguage>
        <padig:lexlanguage string="mon" uri="http://lexvo.org/id/iso639-3/mon">mon</padig:lexlanguage>
        <padig:lexlanguage string="mos" uri="http://lexvo.org/id/iso639-3/mos">mos</padig:lexlanguage>
        <padig:lexlanguage string="mri" uri="http://lexvo.org/id/iso639-3/mri">mri</padig:lexlanguage>
        <padig:lexlanguage string="msa" uri="http://lexvo.org/id/iso639-3/msa">msa</padig:lexlanguage>
        <padig:lexlanguage string="mul" uri="http://lexvo.org/id/iso639-3/mul">mul</padig:lexlanguage>
        <padig:lexlanguage string="mun" uri="http://lexvo.org/id/iso639-5/mun">mun</padig:lexlanguage>
        <padig:lexlanguage string="mus" uri="http://lexvo.org/id/iso639-3/mus">mus</padig:lexlanguage>
        <padig:lexlanguage string="mwl" uri="http://lexvo.org/id/iso639-3/mwl">mwl</padig:lexlanguage>
        <padig:lexlanguage string="mwr" uri="http://lexvo.org/id/iso639-3/mwr">mwr</padig:lexlanguage>
        <padig:lexlanguage string="mya" uri="http://lexvo.org/id/iso639-3/mya">mya</padig:lexlanguage>
        <padig:lexlanguage string="myn" uri="http://lexvo.org/id/iso639-5/myn">myn</padig:lexlanguage>
        <padig:lexlanguage string="myv" uri="http://lexvo.org/id/iso639-3/myv">myv</padig:lexlanguage>
        <padig:lexlanguage string="nah" uri="http://lexvo.org/id/iso639-5/nah">nah</padig:lexlanguage>
        <padig:lexlanguage string="nai" uri="http://lexvo.org/id/iso639-5/nai">nai</padig:lexlanguage>
        <padig:lexlanguage string="nap" uri="http://lexvo.org/id/iso639-3/nap">nap</padig:lexlanguage>
        <padig:lexlanguage string="nau" uri="http://lexvo.org/id/iso639-3/nau">nau</padig:lexlanguage>
        <padig:lexlanguage string="nav" uri="http://lexvo.org/id/iso639-3/nav">nav</padig:lexlanguage>
        <padig:lexlanguage string="nbl" uri="http://lexvo.org/id/iso639-3/nbl">nbl</padig:lexlanguage>
        <padig:lexlanguage string="nde" uri="http://lexvo.org/id/iso639-3/nde">nde</padig:lexlanguage>
        <padig:lexlanguage string="ndo" uri="http://lexvo.org/id/iso639-3/ndo">ndo</padig:lexlanguage>
        <padig:lexlanguage string="nds" uri="http://lexvo.org/id/iso639-3/nds">nds</padig:lexlanguage>
        <padig:lexlanguage string="nep" uri="http://lexvo.org/id/iso639-3/nep">nep</padig:lexlanguage>
        <padig:lexlanguage string="new" uri="http://lexvo.org/id/iso639-3/new">new</padig:lexlanguage>
        <padig:lexlanguage string="nia" uri="http://lexvo.org/id/iso639-3/nia">nia</padig:lexlanguage>
        <padig:lexlanguage string="nic" uri="http://lexvo.org/id/iso639-5/nic">nic</padig:lexlanguage>
        <padig:lexlanguage string="niu" uri="http://lexvo.org/id/iso639-3/niu">niu</padig:lexlanguage>
        <padig:lexlanguage string="nld" uri="http://lexvo.org/id/iso639-3/nld">nld</padig:lexlanguage>
        <padig:lexlanguage string="nno" uri="http://lexvo.org/id/iso639-3/nno">nno</padig:lexlanguage>
        <padig:lexlanguage string="nob" uri="http://lexvo.org/id/iso639-3/nob">nob</padig:lexlanguage>
        <padig:lexlanguage string="nog" uri="http://lexvo.org/id/iso639-3/nog">nog</padig:lexlanguage>
        <padig:lexlanguage string="non" uri="http://lexvo.org/id/iso639-3/non">non</padig:lexlanguage>
        <padig:lexlanguage string="nor" uri="http://lexvo.org/id/iso639-3/nor">nor</padig:lexlanguage>
        <padig:lexlanguage string="nqo" uri="http://lexvo.org/id/iso639-3/nqo">nqo</padig:lexlanguage>
        <padig:lexlanguage string="nso" uri="http://lexvo.org/id/iso639-3/nso">nso</padig:lexlanguage>
        <padig:lexlanguage string="nub" uri="http://lexvo.org/id/iso639-5/nub">nub</padig:lexlanguage>
        <padig:lexlanguage string="nwc" uri="http://lexvo.org/id/iso639-3/nwc">nwc</padig:lexlanguage>
        <padig:lexlanguage string="nya" uri="http://lexvo.org/id/iso639-3/nya">nya</padig:lexlanguage>
        <padig:lexlanguage string="nym" uri="http://lexvo.org/id/iso639-3/nym">nym</padig:lexlanguage>
        <padig:lexlanguage string="nyn" uri="http://lexvo.org/id/iso639-3/nyn">nyn</padig:lexlanguage>
        <padig:lexlanguage string="nyo" uri="http://lexvo.org/id/iso639-3/nyo">nyo</padig:lexlanguage>
        <padig:lexlanguage string="nzi" uri="http://lexvo.org/id/iso639-3/nzi">nzi</padig:lexlanguage>
        <padig:lexlanguage string="oci" uri="http://lexvo.org/id/iso639-3/oci">oci</padig:lexlanguage>
        <padig:lexlanguage string="oji" uri="http://lexvo.org/id/iso639-3/oji">oji</padig:lexlanguage>
        <padig:lexlanguage string="ori" uri="http://lexvo.org/id/iso639-3/ori">ori</padig:lexlanguage>
        <padig:lexlanguage string="orm" uri="http://lexvo.org/id/iso639-3/orm">orm</padig:lexlanguage>
        <padig:lexlanguage string="osa" uri="http://lexvo.org/id/iso639-3/osa">osa</padig:lexlanguage>
        <padig:lexlanguage string="oss" uri="http://lexvo.org/id/iso639-3/oss">oss</padig:lexlanguage>
        <padig:lexlanguage string="ota" uri="http://lexvo.org/id/iso639-3/ota">ota</padig:lexlanguage>
        <padig:lexlanguage string="oto" uri="http://lexvo.org/id/iso639-5/oto">oto</padig:lexlanguage>
        <padig:lexlanguage string="paa" uri="http://lexvo.org/id/iso639-5/paa">paa</padig:lexlanguage>
        <padig:lexlanguage string="pag" uri="http://lexvo.org/id/iso639-3/pag">pag</padig:lexlanguage>
        <padig:lexlanguage string="pal" uri="http://lexvo.org/id/iso639-3/pal">pal</padig:lexlanguage>
        <padig:lexlanguage string="pam" uri="http://lexvo.org/id/iso639-3/pam">pam</padig:lexlanguage>
        <padig:lexlanguage string="pan" uri="http://lexvo.org/id/iso639-3/pan">pan</padig:lexlanguage>
        <padig:lexlanguage string="pap" uri="http://lexvo.org/id/iso639-3/pap">pap</padig:lexlanguage>
        <padig:lexlanguage string="pau" uri="http://lexvo.org/id/iso639-3/pau">pau</padig:lexlanguage>
        <padig:lexlanguage string="peo" uri="http://lexvo.org/id/iso639-3/peo">peo</padig:lexlanguage>
        <padig:lexlanguage string="per" uri="http://lexvo.org/id/iso639-3/fas">per</padig:lexlanguage>
        <padig:lexlanguage string="phi" uri="http://lexvo.org/id/iso639-5/phi">phi</padig:lexlanguage>
        <padig:lexlanguage string="phn" uri="http://lexvo.org/id/iso639-3/phn">phn</padig:lexlanguage>
        <padig:lexlanguage string="pli" uri="http://lexvo.org/id/iso639-3/pli">pli</padig:lexlanguage>
        <padig:lexlanguage string="pol" uri="http://lexvo.org/id/iso639-3/pol">pol</padig:lexlanguage>
        <padig:lexlanguage string="pon" uri="http://lexvo.org/id/iso639-3/pon">pon</padig:lexlanguage>
        <padig:lexlanguage string="por" uri="http://lexvo.org/id/iso639-3/por">por</padig:lexlanguage>
        <padig:lexlanguage string="pra" uri="http://lexvo.org/id/iso639-5/pra">pra</padig:lexlanguage>
        <padig:lexlanguage string="pro" uri="http://lexvo.org/id/iso639-3/pro">pro</padig:lexlanguage>
        <padig:lexlanguage string="pus" uri="http://lexvo.org/id/iso639-3/pus">pus</padig:lexlanguage>
        <padig:lexlanguage string="que" uri="http://lexvo.org/id/iso639-3/que">que</padig:lexlanguage>
        <padig:lexlanguage string="raj" uri="http://lexvo.org/id/iso639-3/raj">raj</padig:lexlanguage>
        <padig:lexlanguage string="rap" uri="http://lexvo.org/id/iso639-3/rap">rap</padig:lexlanguage>
        <padig:lexlanguage string="rar" uri="http://lexvo.org/id/iso639-3/rar">rar</padig:lexlanguage>
        <padig:lexlanguage string="roa" uri="http://lexvo.org/id/iso639-5/roa">roa</padig:lexlanguage>
        <padig:lexlanguage string="roh" uri="http://lexvo.org/id/iso639-3/roh">roh</padig:lexlanguage>
        <padig:lexlanguage string="rom" uri="http://lexvo.org/id/iso639-3/rom">rom</padig:lexlanguage>
        <padig:lexlanguage string="ron" uri="http://lexvo.org/id/iso639-3/ron">ron</padig:lexlanguage>
        <padig:lexlanguage string="rum" uri="http://lexvo.org/id/iso639-3/ron">rum</padig:lexlanguage>
        <padig:lexlanguage string="run" uri="http://lexvo.org/id/iso639-3/run">run</padig:lexlanguage>
        <padig:lexlanguage string="rup" uri="http://lexvo.org/id/iso639-3/rup">rup</padig:lexlanguage>
        <padig:lexlanguage string="rus" uri="http://lexvo.org/id/iso639-3/rus">rus</padig:lexlanguage>
        <padig:lexlanguage string="sad" uri="http://lexvo.org/id/iso639-3/sad">sad</padig:lexlanguage>
        <padig:lexlanguage string="sag" uri="http://lexvo.org/id/iso639-3/sag">sag</padig:lexlanguage>
        <padig:lexlanguage string="sah" uri="http://lexvo.org/id/iso639-3/sah">sah</padig:lexlanguage>
        <padig:lexlanguage string="sai" uri="http://lexvo.org/id/iso639-5/sai">sai</padig:lexlanguage>
        <padig:lexlanguage string="sal" uri="http://lexvo.org/id/iso639-5/sal">sal</padig:lexlanguage>
        <padig:lexlanguage string="sam" uri="http://lexvo.org/id/iso639-3/sam">sam</padig:lexlanguage>
        <padig:lexlanguage string="san" uri="http://lexvo.org/id/iso639-3/san">san</padig:lexlanguage>
        <padig:lexlanguage string="sas" uri="http://lexvo.org/id/iso639-3/sas">sas</padig:lexlanguage>
        <padig:lexlanguage string="sat" uri="http://lexvo.org/id/iso639-3/sat">sat</padig:lexlanguage>
        <padig:lexlanguage string="scn" uri="http://lexvo.org/id/iso639-3/scn">scn</padig:lexlanguage>
        <padig:lexlanguage string="sco" uri="http://lexvo.org/id/iso639-3/sco">sco</padig:lexlanguage>
        <padig:lexlanguage string="sel" uri="http://lexvo.org/id/iso639-3/sel">sel</padig:lexlanguage>
        <padig:lexlanguage string="sem" uri="http://lexvo.org/id/iso639-5/sem">sem</padig:lexlanguage>
        <padig:lexlanguage string="sga" uri="http://lexvo.org/id/iso639-3/sga">sga</padig:lexlanguage>
        <padig:lexlanguage string="sgn" uri="http://lexvo.org/id/iso639-5/sgn">sgn</padig:lexlanguage>
        <padig:lexlanguage string="shn" uri="http://lexvo.org/id/iso639-3/shn">shn</padig:lexlanguage>
        <padig:lexlanguage string="sid" uri="http://lexvo.org/id/iso639-3/sid">sid</padig:lexlanguage>
        <padig:lexlanguage string="sin" uri="http://lexvo.org/id/iso639-3/sin">sin</padig:lexlanguage>
        <padig:lexlanguage string="sio" uri="http://lexvo.org/id/iso639-5/sio">sio</padig:lexlanguage>
        <padig:lexlanguage string="sit" uri="http://lexvo.org/id/iso639-5/sit">sit</padig:lexlanguage>
        <padig:lexlanguage string="sla" uri="http://lexvo.org/id/iso639-5/sla">sla</padig:lexlanguage>
        <padig:lexlanguage string="slk" uri="http://lexvo.org/id/iso639-3/slk">slk</padig:lexlanguage>
        <padig:lexlanguage string="slo" uri="http://lexvo.org/id/iso639-3/slk">slo</padig:lexlanguage>
        <padig:lexlanguage string="slv" uri="http://lexvo.org/id/iso639-3/slv">slv</padig:lexlanguage>
        <padig:lexlanguage string="sma" uri="http://lexvo.org/id/iso639-3/sma">sma</padig:lexlanguage>
        <padig:lexlanguage string="sme" uri="http://lexvo.org/id/iso639-3/sme">sme</padig:lexlanguage>
        <padig:lexlanguage string="smi" uri="http://lexvo.org/id/iso639-5/smi">smi</padig:lexlanguage>
        <padig:lexlanguage string="smj" uri="http://lexvo.org/id/iso639-3/smj">smj</padig:lexlanguage>
        <padig:lexlanguage string="smn" uri="http://lexvo.org/id/iso639-3/smn">smn</padig:lexlanguage>
        <padig:lexlanguage string="smo" uri="http://lexvo.org/id/iso639-3/smo">smo</padig:lexlanguage>
        <padig:lexlanguage string="sms" uri="http://lexvo.org/id/iso639-3/sms">sms</padig:lexlanguage>
        <padig:lexlanguage string="sna" uri="http://lexvo.org/id/iso639-3/sna">sna</padig:lexlanguage>
        <padig:lexlanguage string="snd" uri="http://lexvo.org/id/iso639-3/snd">snd</padig:lexlanguage>
        <padig:lexlanguage string="snk" uri="http://lexvo.org/id/iso639-3/snk">snk</padig:lexlanguage>
        <padig:lexlanguage string="sog" uri="http://lexvo.org/id/iso639-3/sog">sog</padig:lexlanguage>
        <padig:lexlanguage string="som" uri="http://lexvo.org/id/iso639-3/som">som</padig:lexlanguage>
        <padig:lexlanguage string="son" uri="http://lexvo.org/id/iso639-5/son">son</padig:lexlanguage>
        <padig:lexlanguage string="sot" uri="http://lexvo.org/id/iso639-3/sot">sot</padig:lexlanguage>
        <padig:lexlanguage string="spa" uri="http://lexvo.org/id/iso639-3/spa">spa</padig:lexlanguage>
        <padig:lexlanguage string="sqi" uri="http://lexvo.org/id/iso639-3/sqi">sqi</padig:lexlanguage>
        <padig:lexlanguage string="srd" uri="http://lexvo.org/id/iso639-3/srd">srd</padig:lexlanguage>
        <padig:lexlanguage string="srn" uri="http://lexvo.org/id/iso639-3/srn">srn</padig:lexlanguage>
        <padig:lexlanguage string="srp" uri="http://lexvo.org/id/iso639-3/srp">srp</padig:lexlanguage>
        <padig:lexlanguage string="srr" uri="http://lexvo.org/id/iso639-3/srr">srr</padig:lexlanguage>
        <padig:lexlanguage string="ssa" uri="http://lexvo.org/id/iso639-5/ssa">ssa</padig:lexlanguage>
        <padig:lexlanguage string="ssw" uri="http://lexvo.org/id/iso639-3/ssw">ssw</padig:lexlanguage>
        <padig:lexlanguage string="suk" uri="http://lexvo.org/id/iso639-3/suk">suk</padig:lexlanguage>
        <padig:lexlanguage string="sun" uri="http://lexvo.org/id/iso639-3/sun">sun</padig:lexlanguage>
        <padig:lexlanguage string="sus" uri="http://lexvo.org/id/iso639-3/sus">sus</padig:lexlanguage>
        <padig:lexlanguage string="sux" uri="http://lexvo.org/id/iso639-3/sux">sux</padig:lexlanguage>
        <padig:lexlanguage string="swa" uri="http://lexvo.org/id/iso639-3/swa">swa</padig:lexlanguage>
        <padig:lexlanguage string="swe" uri="http://lexvo.org/id/iso639-3/swe">swe</padig:lexlanguage>
        <padig:lexlanguage string="syc" uri="http://lexvo.org/id/iso639-3/syc">syc</padig:lexlanguage>
        <padig:lexlanguage string="syr" uri="http://lexvo.org/id/iso639-3/syr">syr</padig:lexlanguage>
        <padig:lexlanguage string="tah" uri="http://lexvo.org/id/iso639-3/tah">tah</padig:lexlanguage>
        <padig:lexlanguage string="tai" uri="http://lexvo.org/id/iso639-5/tai">tai</padig:lexlanguage>
        <padig:lexlanguage string="tam" uri="http://lexvo.org/id/iso639-3/tam">tam</padig:lexlanguage>
        <padig:lexlanguage string="tat" uri="http://lexvo.org/id/iso639-3/tat">tat</padig:lexlanguage>
        <padig:lexlanguage string="tel" uri="http://lexvo.org/id/iso639-3/tel">tel</padig:lexlanguage>
        <padig:lexlanguage string="tem" uri="http://lexvo.org/id/iso639-3/tem">tem</padig:lexlanguage>
        <padig:lexlanguage string="ter" uri="http://lexvo.org/id/iso639-3/ter">ter</padig:lexlanguage>
        <padig:lexlanguage string="tet" uri="http://lexvo.org/id/iso639-3/tet">tet</padig:lexlanguage>
        <padig:lexlanguage string="tgk" uri="http://lexvo.org/id/iso639-3/tgk">tgk</padig:lexlanguage>
        <padig:lexlanguage string="tgl" uri="http://lexvo.org/id/iso639-3/tgl">tgl</padig:lexlanguage>
        <padig:lexlanguage string="tha" uri="http://lexvo.org/id/iso639-3/tha">tha</padig:lexlanguage>
        <padig:lexlanguage string="tib" uri="http://lexvo.org/id/iso639-3/bod">tib</padig:lexlanguage>
        <padig:lexlanguage string="tig" uri="http://lexvo.org/id/iso639-3/tig">tig</padig:lexlanguage>
        <padig:lexlanguage string="tir" uri="http://lexvo.org/id/iso639-3/tir">tir</padig:lexlanguage>
        <padig:lexlanguage string="tiv" uri="http://lexvo.org/id/iso639-3/tiv">tiv</padig:lexlanguage>
        <padig:lexlanguage string="tkl" uri="http://lexvo.org/id/iso639-3/tkl">tkl</padig:lexlanguage>
        <padig:lexlanguage string="tlh" uri="http://lexvo.org/id/iso639-3/tlh">tlh</padig:lexlanguage>
        <padig:lexlanguage string="tli" uri="http://lexvo.org/id/iso639-3/tli">tli</padig:lexlanguage>
        <padig:lexlanguage string="tmh" uri="http://lexvo.org/id/iso639-3/tmh">tmh</padig:lexlanguage>
        <padig:lexlanguage string="tog" uri="http://lexvo.org/id/iso639-3/tog">tog</padig:lexlanguage>
        <padig:lexlanguage string="ton" uri="http://lexvo.org/id/iso639-3/ton">ton</padig:lexlanguage>
        <padig:lexlanguage string="tpi" uri="http://lexvo.org/id/iso639-3/tpi">tpi</padig:lexlanguage>
        <padig:lexlanguage string="tsi" uri="http://lexvo.org/id/iso639-3/tsi">tsi</padig:lexlanguage>
        <padig:lexlanguage string="tsn" uri="http://lexvo.org/id/iso639-3/tsn">tsn</padig:lexlanguage>
        <padig:lexlanguage string="tso" uri="http://lexvo.org/id/iso639-3/tso">tso</padig:lexlanguage>
        <padig:lexlanguage string="tuk" uri="http://lexvo.org/id/iso639-3/tuk">tuk</padig:lexlanguage>
        <padig:lexlanguage string="tum" uri="http://lexvo.org/id/iso639-3/tum">tum</padig:lexlanguage>
        <padig:lexlanguage string="tup" uri="http://lexvo.org/id/iso639-5/tup">tup</padig:lexlanguage>
        <padig:lexlanguage string="tur" uri="http://lexvo.org/id/iso639-3/tur">tur</padig:lexlanguage>
        <padig:lexlanguage string="tut" uri="http://lexvo.org/id/iso639-5/tut">tut</padig:lexlanguage>
        <padig:lexlanguage string="tvl" uri="http://lexvo.org/id/iso639-3/tvl">tvl</padig:lexlanguage>
        <padig:lexlanguage string="twi" uri="http://lexvo.org/id/iso639-3/twi">twi</padig:lexlanguage>
        <padig:lexlanguage string="tyv" uri="http://lexvo.org/id/iso639-3/tyv">tyv</padig:lexlanguage>
        <padig:lexlanguage string="udm" uri="http://lexvo.org/id/iso639-3/udm">udm</padig:lexlanguage>
        <padig:lexlanguage string="uga" uri="http://lexvo.org/id/iso639-3/uga">uga</padig:lexlanguage>
        <padig:lexlanguage string="uig" uri="http://lexvo.org/id/iso639-3/uig">uig</padig:lexlanguage>
        <padig:lexlanguage string="ukr" uri="http://lexvo.org/id/iso639-3/ukr">ukr</padig:lexlanguage>
        <padig:lexlanguage string="umb" uri="http://lexvo.org/id/iso639-3/umb">umb</padig:lexlanguage>
        <padig:lexlanguage string="und" uri="http://lexvo.org/id/iso639-3/und">und</padig:lexlanguage>
        <padig:lexlanguage string="urd" uri="http://lexvo.org/id/iso639-3/urd">urd</padig:lexlanguage>
        <padig:lexlanguage string="uzb" uri="http://lexvo.org/id/iso639-3/uzb">uzb</padig:lexlanguage>
        <padig:lexlanguage string="vai" uri="http://lexvo.org/id/iso639-3/vai">vai</padig:lexlanguage>
        <padig:lexlanguage string="ven" uri="http://lexvo.org/id/iso639-3/ven">ven</padig:lexlanguage>
        <padig:lexlanguage string="vie" uri="http://lexvo.org/id/iso639-3/vie">vie</padig:lexlanguage>
        <padig:lexlanguage string="vol" uri="http://lexvo.org/id/iso639-3/vol">vol</padig:lexlanguage>
        <padig:lexlanguage string="vot" uri="http://lexvo.org/id/iso639-3/vot">vot</padig:lexlanguage>
        <padig:lexlanguage string="wak" uri="http://lexvo.org/id/iso639-5/wak">wak</padig:lexlanguage>
        <padig:lexlanguage string="wal" uri="http://lexvo.org/id/iso639-3/wal">wal</padig:lexlanguage>
        <padig:lexlanguage string="war" uri="http://lexvo.org/id/iso639-3/war">war</padig:lexlanguage>
        <padig:lexlanguage string="was" uri="http://lexvo.org/id/iso639-3/was">was</padig:lexlanguage>
        <padig:lexlanguage string="wel" uri="http://lexvo.org/id/iso639-3/cym">wel</padig:lexlanguage>
        <padig:lexlanguage string="wen" uri="http://lexvo.org/id/iso639-5/wen">wen</padig:lexlanguage>
        <padig:lexlanguage string="wln" uri="http://lexvo.org/id/iso639-3/wln">wln</padig:lexlanguage>
        <padig:lexlanguage string="wol" uri="http://lexvo.org/id/iso639-3/wol">wol</padig:lexlanguage>
        <padig:lexlanguage string="xal" uri="http://lexvo.org/id/iso639-3/xal">xal</padig:lexlanguage>
        <padig:lexlanguage string="xho" uri="http://lexvo.org/id/iso639-3/xho">xho</padig:lexlanguage>
        <padig:lexlanguage string="yao" uri="http://lexvo.org/id/iso639-3/yao">yao</padig:lexlanguage>
        <padig:lexlanguage string="yap" uri="http://lexvo.org/id/iso639-3/yap">yap</padig:lexlanguage>
        <padig:lexlanguage string="yid" uri="http://lexvo.org/id/iso639-3/yid">yid</padig:lexlanguage>
        <padig:lexlanguage string="yor" uri="http://lexvo.org/id/iso639-3/yor">yor</padig:lexlanguage>
        <padig:lexlanguage string="ypk" uri="http://lexvo.org/id/iso639-5/ypk">ypk</padig:lexlanguage>
        <padig:lexlanguage string="zap" uri="http://lexvo.org/id/iso639-3/zap">zap</padig:lexlanguage>
        <padig:lexlanguage string="zbl" uri="http://lexvo.org/id/iso639-3/zbl">zbl</padig:lexlanguage>
        <padig:lexlanguage string="zen" uri="http://lexvo.org/id/iso639-3/zen">zen</padig:lexlanguage>
        <padig:lexlanguage string="zha" uri="http://lexvo.org/id/iso639-3/zha">zha</padig:lexlanguage>
        <padig:lexlanguage string="zho" uri="http://lexvo.org/id/iso639-3/zho">zho</padig:lexlanguage>
        <padig:lexlanguage string="znd" uri="http://lexvo.org/id/iso639-5/znd">znd</padig:lexlanguage>
        <padig:lexlanguage string="zul" uri="http://lexvo.org/id/iso639-3/zul">zul</padig:lexlanguage>
        <padig:lexlanguage string="zun" uri="http://lexvo.org/id/iso639-3/zun">zun</padig:lexlanguage>
        <padig:lexlanguage string="zza" uri="http://lexvo.org/id/iso639-3/zza">zza</padig:lexlanguage>
    </xsl:param>

    <!-- lookup table for recommended DCMI Types terms/URIs -->
    <xsl:param name="dcmiType">
        <padig:type string="collection" uri="http://purl.org/dc/dcmitype/Collection">collection</padig:type>
        <padig:type string="dataset" uri="http://purl.org/dc/dcmitype/Dataset">dataset</padig:type>
        <padig:type string="event" uri="http://purl.org/dc/dcmitype/Event">event</padig:type>
        <padig:type string="image" uri="http://purl.org/dc/dcmitype/Image">image</padig:type>
        <padig:type string="moving image" uri="http://purl.org/dc/dcmitype/MovingImage">moving image</padig:type>
        <padig:type string="physical object" uri="http://purl.org/dc/dcmitype/PhysicalObject">physical object</padig:type>
        <padig:type string="physical object" uri="http://purl.org/dc/dcmitype/PhysicalObject">physicalobject</padig:type>
        <padig:type string="service" uri="http://purl.org/dc/dcmitype/Service">service</padig:type>
        <padig:type string="software" uri="http://purl.org/dc/dcmitype/Software">software</padig:type>
        <padig:type string="sound" uri="http://purl.org/dc/dcmitype/Sound">sound</padig:type>
        <padig:type string="still image" uri="http://purl.org/dc/dcmitype/StillImage">still image</padig:type>
        <padig:type string="text" uri="http://purl.org/dc/dcmitype/Text">text</padig:type>
    </xsl:param>

    <!-- lookup table for recommended Getty AAT subtype terms/URIs -->
    <xsl:param name="gettySubtype">
        <padig:type string="advertisements" uri="http://vocab.getty.edu/aat/300193993">advertisements</padig:type>
        <padig:type string="architectural documents" uri="http://vocab.getty.edu/aat/300343615">architectural documents</padig:type>
        <padig:type string="books" uri="http://vocab.getty.edu/aat/300028051">books</padig:type>
        <padig:type string="broadsides (notices)" uri="http://vocab.getty.edu/aat/300026739">broadsides</padig:type>
        <padig:type string="business records" uri="http://vocab.getty.edu/aat/300141693">business records</padig:type>
        <padig:type string="cartographic materials" uri="http://vocab.getty.edu/aat/300028052">cartographic materials</padig:type>
        <padig:type string="census records" uri="http://vocab.getty.edu/aat/300026832">census records</padig:type>
        <padig:type string="ceramic ware (visual works)" uri="http://vocab.getty.edu/aat/300386879">certamic ware</padig:type>
        <padig:type string="comics (documents)" uri="http://vocab.getty.edu/aat/300015635">comics</padig:type>
        <padig:type string="correspondence" uri="http://vocab.getty.edu/aat/300026877">correspondence</padig:type>
        <padig:type string="costume (mode of fashion)" uri="http://vocab.getty.edu/aat/300209275">costume</padig:type>
        <padig:type string="cultural artifacts" uri="http://vocab.getty.edu/aat/300265421">cultural artifacts</padig:type>
        <padig:type string="decorative arts" uri="http://vocab.getty.edu/aat/300054168">decorative arts</padig:type>
        <padig:type string="drawings (visual works)" uri="http://vocab.getty.edu/aat/300033973">drawings</padig:type>
        <padig:type string="furniture" uri="http://vocab.getty.edu/aat/300037680">furniture</padig:type>
        <padig:type string="genealogies (histories)" uri="http://vocab.getty.edu/aat/300027015">genealogies</padig:type>
        <padig:type string="government records" uri="http://vocab.getty.edu/aat/300027777">government records</padig:type>
        <padig:type string="graphic arts" uri="http://vocab.getty.edu/aat/300264849">graphic arts</padig:type>
        <padig:type string="interviews" uri="http://vocab.getty.edu/aat/300026392">interviews</padig:type>
        <padig:type string="jewelry" uri="http://vocab.getty.edu/aat/300209286">jewelry</padig:type>
        <padig:type string="motion pictures (visual works)" uri="http://vocab.getty.edu/aat/300136900">motion pictures</padig:type>
        <padig:type string="natural history specimens" uri="http://vocab.getty.edu/aat/300379591">natural history specimens</padig:type>
        <padig:type string="newspapers" uri="http://vocab.getty.edu/aat/300026656">newspapers</padig:type>
        <padig:type string="oral histories (document genre)" uri="http://vocab.getty.edu/aat/300202595">oral histories</padig:type>
        <padig:type string="painting (visual works)" uri="http://vocab.getty.edu/aat/300033618">paiting</padig:type>
        <padig:type string="pamphlets" uri="http://vocab.getty.edu/aat/300220572">pamphlets</padig:type>
        <padig:type string="performances (creative events)" uri="http://vocab.getty.edu/aat/300069200">performances</padig:type>
        <padig:type string="periodicals" uri="http://vocab.getty.edu/aat/300026657">periodicals</padig:type>
        <padig:type string="photographs" uri="http://vocab.getty.edu/aat/300046300">photographs</padig:type>
        <padig:type string="postcards" uri="http://vocab.getty.edu/aat/300026816">postcards</padig:type>
        <padig:type string="posters" uri="http://vocab.getty.edu/aat/300027221">posters</padig:type>
        <padig:type string="prints (visual works)" uri="http://vocab.getty.edu/aat/300041273">color prints</padig:type>
        <padig:type string="prints (visual works)" uri="http://vocab.getty.edu/aat/300041273">prints</padig:type>
        <padig:type string="reference sources" uri="http://vocab.getty.edu/aat/300163404">reference sources</padig:type>
        <padig:type string="sculpture (visual works)" uri="http://vocab.getty.edu/aat/300047090">sculpture</padig:type>
        <padig:type string="sermons" uri="http://vocab.getty.edu/aat/300026669">sermons</padig:type>
        <padig:type string="sheet music" uri="http://vocab.getty.edu/aat/300026430">sheet music</padig:type>
        <padig:type string="sound recording" uri="http://vocab.getty.edu/aat/300028633">sound recording</padig:type>
        <padig:type string="textiles (visual works)" uri="http://vocab.getty.edu/aat/300014063">textiles</padig:type>
        <padig:type string="theses" uri="http://vocab.getty.edu/aat/300028028">theses</padig:type>
        <padig:type string="tools" uri="http://vocab.getty.edu/aat/300024841">tools</padig:type>
        <padig:type string="weapons" uri="http://vocab.getty.edu/aat/300036926">weapons</padig:type>
        <padig:type string="yearbooks" uri="http://vocab.getty.edu/aat/300026646">yearbooks</padig:type>
    </xsl:param>

    <!-- lookup table for Month strings to numbers -->
    <xsl:param name="monthLookup">
        <padig:month string="01">jan</padig:month>
        <padig:month string="02">feb</padig:month>
        <padig:month string="03">mar</padig:month>
        <padig:month string="04">apr</padig:month>
        <padig:month string="05">may</padig:month>
        <padig:month string="06">june</padig:month>
        <padig:month string="06">jun</padig:month>
        <padig:month string="07">july</padig:month>
        <padig:month string="07">jul</padig:month>
        <padig:month string="08">aug</padig:month>
        <padig:month string="09">sept</padig:month>
        <padig:month string="09">sep</padig:month>
        <padig:month string="10">oct</padig:month>
        <padig:month string="11">nov</padig:month>
        <padig:month string="12">dec</padig:month>
    </xsl:param>
</xsl:stylesheet>
