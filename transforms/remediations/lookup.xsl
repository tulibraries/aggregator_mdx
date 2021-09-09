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
    xmlns:svcs="http://rdfs.org/sioc/services"
    version="2.0">

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
        <padig:url string="Lehigh University" code="LEHIGH">http://cdm.lib.lehigh.edu/</padig:url>
        <padig:url string="Curtis Institute of Music" code="CURTIS">http://cdm16667.contentdm.oclc.org/</padig:url>
        <padig:url string="La Salle University" code="LASALLE">http://cdm15860.contentdm.oclc.org/</padig:url>
        <padig:url string="Pennsylvania State University" code="PENNSTATE">http://digital.libraries.psu.edu/</padig:url>
        <padig:url string="Temple University" code="TEMPLE">http://digital.library.temple.edu/</padig:url>
        <padig:url string="University of Pennsylvania" code="PENN">http://digital.library.upenn.edu/</padig:url>
        <padig:url string="Villanova University" code="VILLANOVA">https://digital.library.villanova.edu/</padig:url>
        <padig:url string="Thomas Jefferson University - East Falls" code="JEF">http://digitalcollections.philau.edu/</padig:url>
        <padig:url string="La Salle University" code="LASALLE">http://digitalcommons.lasalle.edu/</padig:url>
        <padig:url string="La Salle University" code="LASALLE">https://digitalcommons.lasalle.edu/</padig:url>
        <padig:url string="Philadelphia College of Osteopathic Medicine" code="PCOM">http://digitalcommons.pcom.edu/</padig:url>
        <padig:url string="Philadelphia College of Osteopathic Medicine" code="PCOM">https://digitalcommons.pcom.edu/</padig:url>
        <padig:url string="Ursinus College" code="URSINUS">http://digitalcommons.ursinus.edu/</padig:url>
        <padig:url string="Ursinus College" code="URSINUS">https://digitalcommons.ursinus.edu/</padig:url>
        <padig:url string="University of Scranton" code="USCRANTON">http://digitalservices.scranton.edu/</padig:url>
        <padig:url string="Widener University" code="WIDEN">http://digitalwolfgram.widener.edu/</padig:url>
        <padig:url string="University of Pennsylvania" code="PENN">http://dla.library.upenn.edu/dla/</padig:url>
        <padig:url string="University of Pittsburgh" code="PITT">https://digital.library.pitt.edu/</padig:url>
        <padig:url string="University of Pittsburgh" code="PITT">http://digital.library.pitt.edu/</padig:url>
        <padig:url string="Thomas Jefferson University" code="TJU">http://jdc.jefferson.edu/</padig:url>
        <padig:url string="Thomas Jefferson University" code="TJU">https://jdc.jefferson.edu/</padig:url>
        <padig:url string="Susquehanna University" code="SUSQU">http://pahistoryharvest.com/</padig:url>
        <padig:url string="Pennsylvania State Archives" code="PSA">http://psa.powerlibrary.org/</padig:url>
        <padig:url string="Historical Medical Library of The College of Physicians of Philadelphia" code="CPP">http://www.cppdigitallibrary.org/</padig:url>
        <padig:url string="Historical Medical Library of The College of Physicians of Philadelphia" code="CPP">https://www.cppdigitallibrary.org/</padig:url>
        <padig:url string="Presbyterian Historical Society" code="PHS">https://digital.history.pcusa.org/</padig:url>
        <padig:url string="The Library Company of Philadelphia" code="LIBCO">https://digital.librarycompany.org/</padig:url>
        <padig:url string="Science History Institute" code="SHI">https://digital.sciencehistory.org/</padig:url>
        <padig:url string="American Philosophical Society" code="APS">https://diglib.amphilsoc.org/</padig:url>
        <padig:url string="Lafayette College" code="LAFAYETTE">https://ldr.lafayette.edu/</padig:url>
        <padig:url string="Lafayette College" code="LAFAYETTE">http://hdl.handle.net/10385/</padig:url>
        <padig:url string="Franklin and Marshall College" code="FANDM">https://digital.fandm.edu/</padig:url>
        <padig:url string="Media Historic Archives Commission" code="MHAC">https://www.mediahistoricarchives.org/</padig:url>
        <padig:url string="Catholic Historical Research Center of the Archdiocese of Philadelphia" code="CHRC">https://omeka.chrc-phila.org/</padig:url>
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
        <!-- Lehigh -->
        <padig:set string="I Remain">letters</padig:set>
        <padig:set string="Postcards">postal</padig:set>
        <!-- LaSalle CDM -->
        <padig:set string="Rick McCarty PTSD Drawings">p15860coll1</padig:set>
        <padig:set string="Nina Talbot, Veterans">p15860coll5</padig:set>
        <padig:set string="North Vietnamese Propaganda Posters">p15860coll7</padig:set>
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

        <!-- Lafayette -->
        <padig:set string="College Archives Image Collection">collection:College+Archives+Image+Collection</padig:set>
        <padig:set string="Gerald And Rella Warner Dutch East Indies Negatives">collection:Gerald+and+Rella+Warner+Dutch+East+Indies+Negatives</padig:set>
        <padig:set string="Gerald And Rella Warner Japan Slides">collection:Gerald+and+Rella+Warner+Japan+Slides</padig:set>
        <padig:set string="Gerald And Rella Warner Manchuria Negatives">collection:Gerald+and+Rella+Warner+Manchuria+Negatives</padig:set>
        <padig:set string="Gerald And Rella Warner Postcards">collection:Gerald+and+Rella+Warner+Postcards</padig:set>
        <padig:set string="Lafayette Newspaper Archive">collection:Lafayette+Newspaper+archive</padig:set>
        <padig:set string="Lafayette Magazine Archive">collection:Lafayette+Magazine+archive</padig:set>
        <padig:set string="Marquis De Lafayette Prints Collection">collection:Marquis+de+Lafayette+Prints+Collection</padig:set>
        <padig:set string="McKelvy House">collection:McKelvy+House</padig:set>

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
        <!-- PCOM -->
        <padig:set string="Classic Osteopathic Medical Works">publication:classic_med_works</padig:set>
        <padig:set string="Commencements">publication:commencements</padig:set>
        <padig:set string="Herald of Osteopathy">publication:herald_of_osteopathy</padig:set>
        <padig:set string="Osteopathic Medicine">publication:osteopathic_medicine</padig:set>
        <padig:set string="Digest">publication:digest</padig:set>
        <padig:set string="Philadelphia Journal of Osteopathy">publication:phila_j_osteopathy</padig:set>
        <padig:set string="The Axone">publication:axone</padig:set>
        <padig:set string="Yearbooks">publication:yearbooks</padig:set>
        <!-- Ursinus -->
        <padig:set string="The Dutchman / The Pennsylvania Dutchman Magazine">publication:dutchmanmag</padig:set>
        <padig:set string="Pennsylvania Folklife Magazine">publication:pafolklifemag</padig:set>
        <padig:set string="Pennsylvania Folklife Magazine Indexes">publication:pafolklifemagindex</padig:set>
        <padig:set string="Providence Independent Newspaper, 1875-1898">publication:providence</padig:set>
        <padig:set string="Yost History of Ursinus College">publication:yosthistory</padig:set>
        <padig:set string="Ursinus College Fraktur Collection">publication:ursinus_fraktur</padig:set>
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
        <!-- Curtis -->
        <padig:set string="de Pasquale collection">myfirst</padig:set>
        <padig:set string="Curtis program books">p16667coll1</padig:set>
        <padig:set string="Archives- Image Collection">p16667coll3</padig:set>
        <padig:set string="Collection of Samuel Barber Materials">p16667coll4</padig:set>
        <padig:set string="Eleanor Lipkin Papers">p16667coll5</padig:set>
        <!-- Historic Pittsburgh -->
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
        <padig:set string="Darlington Family Papers">pitt_collection.100</padig:set>
        <padig:set string="Daughters of Erin Court #9 Records">pitt_collection.173</padig:set>
        <padig:set string="Department of Public Health Annual Records, Pittsburgh, PA">pitt_collection.345</padig:set>
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
        <padig:set string="Henry Marie Brackenridge and Family Papers">pitt_collection.103</padig:set>
        <padig:set string="Historic Pittsburgh Book Collection">pitt_collection.241</padig:set>
        <padig:set string="Historical Society of Upper St. Clair Collection">pitt_collection.50</padig:set>
        <padig:set string="Homer S. Brown Papers">pitt_collection.352</padig:set>
        <padig:set string="Hotel Schenley Register">pitt_collection.175</padig:set>
        <padig:set string="Howard Etzel Photograph Collection">pitt_collection.310</padig:set>
        <padig:set string="Hugh Henry Brackenridge and Andrew Watson Papers">pitt_collection.21</padig:set>
        <padig:set string="Irene Kaufmann Settlement Photographs">pitt_collection.51</padig:set>
        <padig:set string="Irish Centre of Pittsburgh Records">pitt_collection.172</padig:set>
        <padig:set string="Iroquois Land Deed">pitt_collection.114</padig:set>
        <padig:set string="Isaac and Samuel Miller Farm Account Book">pitt_collection.273</padig:set>
        <padig:set string="James Benney Photographs">pitt_collection.52</padig:set>
        <padig:set string="James Veech Copybook of the General William Irvine Papers">pitt_collection.22</padig:set>
        <padig:set string="Jennie Bradley Roessing Papers">pitt_collection.343</padig:set>
        <padig:set string="Jewish Sports Hall of Fame of Western Pennsylvania Photographs">pitt_collection.54</padig:set>
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
        <padig:set string="Kingsley Association Records">pitt_collection.58</padig:set>
        <padig:set string="Lyon, Shorb &amp; Company Photographs">pitt_collection.59</padig:set>
        <padig:set string="M. Stanford Jackson Papers">pitt_collection.281</padig:set>
        <padig:set string="March of the Pittsburgh Blues Copybook">pitt_collection.98</padig:set>
        <padig:set string="Marshall W. &quot;Major&quot; Taylor Scrapbooks">pitt_collection.202</padig:set>
        <padig:set string="Mary Elinor Lazenby Papers">pitt_collection.275</padig:set>
        <padig:set string="Mary Roberts Rinehart Papers">pitt_collection.185</padig:set>
        <padig:set string="Max A. Lauffer Papers">pitt_collection.197</padig:set>
        <padig:set string="McConway and Torely Company Records">pitt_collection.322</padig:set>
        <padig:set string="McFarland-Hall-Beck Families Papers">pitt_collection.201</padig:set>
        <padig:set string="Mellon Bank Records">pitt_collection.287</padig:set>
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
        <padig:set string="Russell H. Heffley Photographs">pitt_collection.148</padig:set>
        <padig:set string="Rust Engineering Company Records">pitt_collection.80</padig:set>
        <padig:set string="Samuel A. Musgrave Photographs">pitt_collection.289</padig:set>
        <padig:set string="Schnabel Company Photographs">pitt_collection.313</padig:set>
        <padig:set string="Seder Family Photographs">pitt_collection.81</padig:set>
        <padig:set string="Shadyside Hospital Records">pitt_collection.334</padig:set>
        <padig:set string="Smoke Control Lantern Slides">pitt_collection.82</padig:set>
        <padig:set string="Spencer Family Photographs">pitt_collection.83</padig:set>
        <padig:set string="Stephen Foster Collection">pitt_collection.111</padig:set>
        <padig:set string="Tax-Book of Pitt Township, Allegheny County, Pa.">pitt_collection.84</padig:set>
        <padig:set string="Teenie Harris Photographs">pitt_collection.85</padig:set>
        <padig:set string="The Bulletin, Pittsburg Bulletin, and The Bulletin Index">pitt_collection.324</padig:set>
        <padig:set string="Thomas C. Brogan Papers on The Mayor's Task Force of Civil Disorders">pitt_collection.350</padig:set>
        <padig:set string="Thomas Mellon Galey Photographs">pitt_collection.321</padig:set>
        <padig:set string="Thomas Mellon and William B. Negley Day Book">pitt_collection.29</padig:set>
        <padig:set string="Trimble Company Records">pitt_collection.88</padig:set>
        <padig:set string="Union Arcade Building Photographs">pitt_collection.90</padig:set>
        <padig:set string="Union Switch &amp; Signal Strike Photographs">pitt_collection.91</padig:set>
        <padig:set string="United Electrical, Radio, and Machine Workers of America (UE) Records">pitt_collection.89</padig:set>
        <padig:set string="United Jewish Federation of Greater Pittsburgh Photographs">pitt_collection.162</padig:set>
        <padig:set string="United States Army Corps of Engineers, Pittsburgh District Glass Plate Negatives">pitt_collection.316</padig:set>
        <padig:set string="University of Pittsburgh Greensburg">pitt_collection.14</padig:set>
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
        <padig:set string="Melvin Seidenberg Photographs">pitt_collection.332</padig:set>
        <padig:set string="Louis Semple Clarke Collection">pitt_collection.333</padig:set>
        <padig:set string="Children's Service Bureau Records">pitt_collection.337</padig:set>
        <padig:set string="Darlington Digital Library">pitt_collection.153</padig:set>
        <!-- University of Pittsburgh -->
        <padig:set string="19th Century Schoolbooks">pitt_collection.120</padig:set>
        <padig:set string="Abner Shimony Papers">pitt_collection.121</padig:set>
        <padig:set string="Allen Family Papers">pitt_collection.122</padig:set>
        <padig:set string="An Attempt to Describe the Future of the United States">pitt_collection.245</padig:set>
        <padig:set string="Archives of Scientific Philosophy">pitt_collection.123</padig:set>
        <padig:set string="Arlen Specter Senatorial Papers">pitt_collection.288</padig:set>
        <padig:set string="Audubon's Birds of America">pitt_collection.1</padig:set>
        <padig:set string="Autograph Files of H. Edmund Friesell">pitt_collection.169</padig:set>
        <padig:set string="Barry Rosensteel Japanese Print Collection">pitt_collection.124</padig:set>
        <padig:set string="Bruno De Finetti Papers">pitt_collection.125</padig:set>
        <padig:set string="Burd-Shippen Family Papers">pitt_collection.115</padig:set>
        <padig:set string="Carl Gustav Hempel Papers">pitt_collection.126</padig:set>
        <padig:set string="Chartres: Cathedral of Notre-Dame">pitt_collection.127</padig:set>
        <padig:set string="China's Cultural Revolution in Memories: The CR/10 Project">pitt_collection.302</padig:set>
        <padig:set string="Chinese Land Records">pitt_collection.179</padig:set>
        <padig:set string="Chinese Marriage Documents">pitt_collection.196</padig:set>
        <padig:set string="Chinese Overseas Student Newsletters">pitt_collection.244</padig:set>
        <padig:set string="Chinese Political Prisoner Photograph Collection">pitt_collection.251</padig:set>
        <padig:set string="Dick Thornburgh Papers">pitt_collection.143</padig:set>
        <padig:set string="Erroll Garner Archive">pitt_collection.340</padig:set>
        <padig:set string="Fidelis Zitterbart Manuscripts">pitt_collection.190</padig:set>
        <padig:set string="Fox Chapel Garden Club Records">pitt_collection.360</padig:set>
        <padig:set string="Frank Plumpton Ramsey Papers">pitt_collection.128</padig:set>
        <padig:set string="Fred Wright Cartoons">pitt_collection.112</padig:set>
        <padig:set string="Gao Lecture Series">pitt_collection.357</padig:set>
        <padig:set string="George Washington Collection">pitt_collection.183</padig:set>
        <padig:set string="Hans Reichenbach Papers">pitt_collection.177</padig:set>
        <padig:set string="Henry F. and Kate B. Hebley Collection of Soviet Lantern Slides">pitt_collection.335</padig:set>
        <padig:set string="James Wilkinson Papers">pitt_collection.116</padig:set>
        <padig:set string="Kōgyo: The Art of Noh">pitt_collection.130</padig:set>
        <padig:set string="Lillian A. Friedberg Postcards">pitt_collection.223</padig:set>
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
        <padig:set string="Ramón Gómez de la Serna Papers">pitt_collection.132</padig:set>
        <padig:set string="Rare Books and Imprints">pitt_collection.298</padig:set>
        <padig:set string="Richard C. Jeffrey Papers">pitt_collection.133</padig:set>
        <padig:set string="Rose Rand Papers">pitt_collection.134</padig:set>
        <padig:set string="Rudolf Carnap Papers">pitt_collection.135</padig:set>
        <padig:set string="Shooting Star Review">pitt_collection.299</padig:set>
        <padig:set string="Stalinka: Digital Library of Staliniana">pitt_collection.136</padig:set>
        <padig:set string="Stockton Family Letters">pitt_collection.118</padig:set>
        <padig:set string="Thaddeus Sheldon Papers">pitt_collection.113</padig:set>
        <padig:set string="Theodore M. Finney Music Library Collection">pitt_collection.295</padig:set>
        <padig:set string="Thomas G. Masaryk Papers">pitt_collection.319</padig:set>
        <padig:set string="University Catalogues">pitt_collection.326</padig:set>
        <padig:set string="University of Pittsburgh Bradford">pitt_collection.330</padig:set>
        <padig:set string="University of Pittsburgh Johnstown">pitt_collection.192</padig:set>
        <padig:set string="University of Pittsburgh Press Digital Editions">pitt_collection.137</padig:set>
        <padig:set string="University Times">pitt_collection.325</padig:set>
        <padig:set string="V.F. Wachsmuth Treatise">pitt_collection.256</padig:set>
        <padig:set string="Vézelay: Benedictine Abbey of Sainte Marie Madeleine">pitt_collection.138</padig:set>
        <padig:set string="Visuals for Foreign Language Instruction">pitt_collection.139</padig:set>
        <padig:set string="Walter and Martha Leuba Papers">pitt_collection.140</padig:set>
        <padig:set string="Wesley C. Salmon Papers">pitt_collection.141</padig:set>
        <padig:set string="Wilfrid S. Sellars Papers">pitt_collection.142</padig:set>
        <padig:set string="William and James Scull Survey Ledgers">pitt_collection.259</padig:set>
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
        <!-- Bloomsburg -->
        <padig:set string="Bloomsburg University Map Collection">blmmap</padig:set>
        <padig:set string="Bloomsburg University Photographs Collection">blmphoto</padig:set>
        <padig:set string="Bloomsburg University Postcard Collection">blmpost</padig:set>
        <padig:set string="Bloomsburg University Town Council Minutes Collection">CHSminutes</padig:set>
        <padig:set string="Bloomsburg University World War I Student Files Collection">blmwwi</padig:set>
        <!-- Millersville -->
        <padig:set string="Millersville University Photograph Collection">mvsphoto</padig:set>
        <padig:set string="Millersville University Postcard Collection">wingpost</padig:set>
        <!-- Slippery Rock -->
        <padig:set string="Slippery Rock University Audio Collection">audio</padig:set>
        <padig:set string="Slippery Rock University Photograph Collection">photograph</padig:set>
        <padig:set string="Slippery Rock University Postcard Collection">postcard</padig:set>
        <padig:set string="Slippery Rock University Yearbooks - The Saxigena (selected years)">yearbooks</padig:set>
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
        <!-- Swarthaverford -->
        <padig:set string="Truman-Underhill Photograph Collection">SC_Truman</padig:set>
        <padig:set string="Quaker Broadsides Collection">SC_Broad</padig:set>
        <!-- APS -->
        <padig:set string="Eastern State Penitentiary">text_Mss.365.P381p</padig:set>
        <padig:set string="Henry Howard Houston III">graphics_Mss.Ms.Coll.76.17</padig:set>
        <padig:set string="Thomas Paine Political Cartoons">graphics_Mss.B.P165</padig:set>
        <padig:set string="Titian Ramsay Peale Sketches">graphics_Mss.B.P.31.15d</padig:set>
        <padig:set string="William Parker Foulke">text_Mss.B.F826</padig:set>
        <padig:set string="Graphics Collection">islandora_graphics_collection</padig:set>

        <!-- LaSalle Bepress -->
        <padig:set string="La Salle Alumni Association Newsletter">publication:alumni_assoc_newsletter</padig:set>
        <padig:set string="La Salle College Alumni News">publication:alumni_news</padig:set>
        <padig:set string="La Salle Alumnus">publication:alumnus</padig:set>
        <padig:set string="La Salle Basketball Media Guides">publication:basketball_media_guides</padig:set>
        <padig:set string="Campus News">publication:campus_news</padig:set>
        <padig:set string="College Budget">publication:college_budget</padig:set>
        <padig:set string="La Salle Commencement Programs">publication:commencement_programs</padig:set>
        <padig:set string="La Salle Course Catalogs">publication:course_catalogs</padig:set>
        <padig:set string="Local History Essays">publication:essays</padig:set>
        <padig:set string="Explorer (Yearbooks)">publication:explorer</padig:set>
        <padig:set string="La Salle Alumni Association Explorer News">publication:explorer_news</padig:set>
        <padig:set string="Faculty Bulletins">publication:faculty_bulletins</padig:set>
        <padig:set string="Faculty and Staff Directories">publication:faculty_staff_directories</padig:set>
        <padig:set string="La Salle Magazine">publication:lasalle_magazine</padig:set>
        <padig:set string="La Salle Press Releases">publication:press_releases</padig:set>
        <padig:set string="La Salle Student Handbooks">publication:student_handbooks</padig:set>
        <padig:set string="Interviews">publication:vietnam_interviews</padig:set>

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
        <padig:set string="Digital Collections">islandora_root</padig:set>
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
        <padig:set string="Peter Collinson's 1739 Annotated First Edition of the "History of London"">Islandora_COLL1</padig:set>
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

    <!-- Presbyterian Historical Society -->
        <padig:set string="Baird Family Papers">islandora_rg316</padig:set>
        <padig:set string="Church Buildings">islandora_churchbuildings</padig:set>
        <padig:set string="Henry Harmon Spalding and Eliza Hart Spalding Papers">islandora_spalding</padig:set>
        <padig:set string="Oral Histories Collection">islandora_oralhistories_collection</padig:set>
        <padig:set string="Presbyterian Historical Society Audio Collection">islandora_audio_collection</padig:set>
        <padig:set string="Presbyterian Historical Society Map Collection">islandora_maps</padig:set>
        <padig:set string="Presbyterian Historical Society Portraits">islandora_portraits</padig:set>
        <padig:set string="Presbyterian Historical Society Video Collection">islandora_video_collection</padig:set>
        <padig:set string="Religious News Service Photographs">islandora_rns</padig:set>
        <padig:set string="Relocation of Japanese-Americans during the Second World War">islandora_slides_b34</padig:set>

    <!-- Penn State -->
        <padig:set string="A Few Good Women">afgw</padig:set>
        <padig:set string="A. E. Bye Papers">aebye</padig:set>
        <padig:set string="A. J. Thompson Civil War Diary">ajt</padig:set>
        <padig:set string="Alice Marshall Collection">amc</padig:set>
        <padig:set string="Amalgamated Association of Iron, Steel, and Tin Workers of North America Records">amalgamated</padig:set>
        <padig:set string="Anderson and Ellis Art Education Collection">arted</padig:set>
        <padig:set string="Brent Wilson Papers">brentwilson</padig:set>
        <padig:set string="Cresson Literary Society Records">cls</padig:set>
        <padig:set string="Daniel Elias Frantz Diary">def</padig:set>
        <padig:set string="Digital Map Drawer">maps1</padig:set>
        <padig:set string="Edwin Forbes Civil War Etchings">Forbes</padig:set>
        <padig:set string="Elisha J. Bracken Civil War Diary">ejb</padig:set>
        <padig:set string="George and Alice Beatty Papers">gbp</padig:set>
        <padig:set string="George Hoenshel Fleming Sr. Family Papers">fleming</padig:set>
        <padig:set string="George Medrick Papers">medrick</padig:set>
        <padig:set string="Harold Rasmussen Scrapbooks, Badges, and Buttons">rasmussen</padig:set>
        <padig:set string="Howard Truman Curtiss Papers">curtiss</padig:set>
        <padig:set string="Jerry Doyle Papers">jdp</padig:set>
        <padig:set string="John Chorey Papers">chorey</padig:set>
        <padig:set string="Joseph Priestley Collection">priestley</padig:set>
        <padig:set string="Kirschner Family Papers">kirschner</padig:set>
        <padig:set string="Mira Dock Lantern Slides">mdfls</padig:set>
        <padig:set string="Morris W. Hackman Civil War Diary">mwh</padig:set>
        <padig:set string="Penn State Froth">froth</padig:set>
        <padig:set string="Penn State Libraries Photo Archive">psuphotos</padig:set>
        <padig:set string="Pennsylvania Bridges Collection">pab</padig:set>
        <padig:set string="Philip Murray Papers">murray</padig:set>
        <padig:set string="Pinkerton's National Detective Agency"></padig:set>
        <padig:set string="Sarah Chamberlin Eccleston Diary and Journal, 1864-1916">chamberlin</padig:set>
        <padig:set string="T. R. Johns">trjohns</padig:set>
        <padig:set string="Thomas W. Benson Political Protest Collection">benson</padig:set>
        <padig:set string="Union League of Philadelphia Archives">ulp</padig:set>
        <padig:set string="United Mine Workers of America Photographic, Graphic, and Artifacts Collection">umwap</padig:set>
        <padig:set string="United Mine Workers of America, President's Office Correspondence">umwac</padig:set>
        <padig:set string="United Steelworkers of America District 33 Records">district33</padig:set>
        <padig:set string="Walter R. Collins Civil War Diaries and Photograph">wrc</padig:set>
        <padig:set string="Washington Literary Society Records, 1859-1895">wls</padig:set>
        <padig:set string="William H.H. Fisher Civil War Diary">whf</padig:set>
        <padig:set string="World War I Glass Plate Stereographs">ww1stereo</padig:set>
        <padig:set string="WPA Bituminous Coal Mine Maps">wpamaps</padig:set>
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
        <padig:set string="Memento Mütter">4</padig:set>
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
