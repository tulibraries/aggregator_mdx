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

    <!-- lookup table for Contributing Institutions/OAI base URLs -->
    <xsl:param name="oaiUrl">    
		<padig:url string="Lehigh University">http://cdm.lib.lehigh.edu/</padig:url>
		<padig:url string="La Salle University">http://cdm15860.contentdm.oclc.org/</padig:url>
		<padig:url string="Pennsylvania State University">http://digital.libraries.psu.edu/</padig:url>
		<padig:url string="Temple University">http://digital.library.temple.edu/</padig:url>
		<padig:url string="University of Pennsylvania">http://digital.library.upenn.edu/</padig:url>
		<padig:url string="Villanova University">http://digital.library.villanova.edu/</padig:url>
		<padig:url string="Jefferson - East Falls">http://digitalcollections.philau.edu/</padig:url>
		<padig:url string="La Salle University">http://digitalcommons.lasalle.edu/</padig:url>
		<padig:url string="Philadelphia College of Osteopathic Medicine">http://digitalcommons.pcom.edu/</padig:url>
		<padig:url string="Ursinus College">http://digitalcommons.ursinus.edu/</padig:url>
		<padig:url string="University of Scranton">http://digitalservices.scranton.edu/</padig:url>
		<padig:url string="Widener Univeristy">http://digitalwolfgram.widener.edu/</padig:url>
		<padig:url string="University of Pennsylvania">http://dla.library.upenn.edu/dla/</padig:url>
		<padig:url string="Thomas Jefferson University">http://jdc.jefferson.edu/</padig:url>
		<padig:url string="Susquehanna University">http://pahistoryharvest.com/</padig:url>
		<padig:url string="Pennsylvania State Archives">http://psa.powerlibrary.org/</padig:url>
		<padig:url string="Historical Medical Library of The College of Physicians of Philadelphia">http://www.cppdigitallibrary.org/</padig:url>
		<padig:url string="Presbyterian Historical Society">https://digital.history.pcusa.org/</padig:url>
		<padig:url string="The Library Company of Philadelphia">https://digital.librarycompany.org/</padig:url>
		<padig:url string="Science History Institute">https://digital.sciencehistory.org/</padig:url>
		<padig:url string="American Philosophical Society">https://diglib.amphilsoc.org/</padig:url>
    </xsl:param>
    
	<!-- lookup table for Intermediate Providers/OAI base URLs -->
	<xsl:param name="oaiUrlInt">
		<padig:url string="Keystone Library Network">http://cdm17189.contentdm.oclc.org/</padig:url>
		<padig:url string="Lackawanna Valley Digital Archives">http://content.lackawannadigitalarchives.org/</padig:url>
		<padig:url string="Keystone Library Network">http://digital.klnpa.org/</padig:url>
		<padig:url string="POWER Library as sponsor and HSLC as maintainer">http://digitalcollections.powerlibrary.org/</padig:url>
		<padig:url string="Historic Pittsburgh">http://historicpittsburgh.org/</padig:url>
	</xsl:param>
	
	<!-- lookup table for setSpec -->	
    <xsl:param name="setSpecList">
		<padig:set string="Aerial Photographs of Pittsburgh">pitt_collection.33</padig:set>
		<padig:set string="African American Jazz Preservation Society of Pittsburgh Oral History Project Records and Recordings">pitt_collection.212</padig:set>
		<padig:set string="African American Construction Workers of Pittsburgh Photographs">pitt_collection.176</padig:set>
		<padig:set string="Alexander Addison Papers">pitt_collection.15</padig:set>
		<padig:set string="Alexander Cumming Papers">pitt_collection.249</padig:set>
		<padig:set string="Allegheny Conference on Community Development Photographs">pitt_collection.34</padig:set>
		<padig:set string="Allegheny County Photography Department Photographs">pitt_collection.320</padig:set>
		<padig:set string="Allegheny Observatory Records">pitt_collection.108</padig:set>
		<padig:set string="Aluminum Company of America Photographs">pitt_collection.274</padig:set>
		<padig:set string="American Left Ephemera Collection">pitt_collection.107</padig:set>
		<padig:set string="Archives of Industrial Society Photograph Collection">pitt_collection.226</padig:set>
		<padig:set string="Beazel Family Papers">pitt_collection.246</padig:set>
		<padig:set string="Bedford County Township Tax Receipts">pitt_collection.16</padig:set>
		<padig:set string="Bill Green Photographs">pitt_collection.328</padig:set>
		<padig:set string="Birmingham United Church of Christ Records">pitt_collection.187</padig:set>
		<padig:set string="Blind and Vision Rehabilitation Services of Pittsburgh">pitt_collection.308</padig:set>
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
		<padig:set string="Christopher Gist's Journals by William M. Darlington">pitt_collection.101</padig:set>
		<padig:set string="City Directories">pitt_collection.49</padig:set>
		<padig:set string="City of Pittsburgh Geodetic and Topographic Survey Maps">pitt_collection.294</padig:set>
		<padig:set string="Communist Collection of A.E. Forbes">pitt_collection.106</padig:set>
		<padig:set string="Conference between the Six Nations and the Quakers Minutes">pitt_collection.144</padig:set>
		<padig:set string="Congregation B'nai Israel Photographs">pitt_collection.154</padig:set>
		<padig:set string="Coroner's Office Records, Allegheny County, Pa.">pitt_collection.174</padig:set>
		<padig:set string="D. L. Clark Company Papers and Photographs">pitt_collection.314</padig:set>
		<padig:set string="Daniel Brodhead Papers">pitt_collection.18</padig:set>
		<padig:set string="Darlington Family Papers">pitt_collection.100</padig:set>
		<padig:set string="Daughters of Erin Court #9 Records">pitt_collection.173</padig:set>
		<padig:set string="Donohoe Family Papers">pitt_collection.102</padig:set>
		<padig:set string="Dorsey-Turfley Family Photographs">pitt_collection.40</padig:set>
		<padig:set string="Dunning McNair and Dunning Robert McNair Papers">pitt_collection.19</padig:set>
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
		<padig:set string="G.M. Hopkins Company Maps">pitt_collection.240</padig:set>
		<padig:set string="George Westinghouse Museum Collection">pitt_collection.286</padig:set>
		<padig:set string="Greenstone United Methodist Church, Avalon, Pa. Records">pitt_collection.17</padig:set>
		<padig:set string="Gulf Oil Corporation Records">pitt_collection.290</padig:set>
		<padig:set string="H.H. Seiferth Sign Company Photographs">pitt_collection.161</padig:set>
		<padig:set string="H.J. Heinz Company Photographs">pitt_collection.47</padig:set>
		<padig:set string="H.K. Porter Co., Pittsburgh, Pa. Records">pitt_collection.247</padig:set>
		<padig:set string="Harold Corsini Photographs">pitt_collection.146</padig:set>
		<padig:set string="Harold V. Cohen Photographs">pitt_collection.312</padig:set>
		<padig:set string="Hebrew Institute Photographs">pitt_collection.48</padig:set>
		<padig:set string="Henry Clay Frick Business Records">pitt_collection.156</padig:set>
		<padig:set string="Henry Marie Brackenridge and Family Papers">pitt_collection.103</padig:set>
		<padig:set string="Historic Pittsburgh Book Collection">pitt_collection.241</padig:set>
		<padig:set string="Historical Society of Upper St. Clair Collection">pitt_collection.50</padig:set>
		<padig:set string="Hotel Schenley Register">pitt_collection.175</padig:set>
		<padig:set string="Howard Etzel Photograph Collection">pitt_collection.310</padig:set>
		<padig:set string="Hugh Henry Brackenridge and Andrew Watson Papers">pitt_collection.21</padig:set>
		<padig:set string="Irene Kaufmann Settlement Photographs">pitt_collection.51</padig:set>
		<padig:set string="Irish Centre of Pittsburgh Records">pitt_collection.172</padig:set>
		<padig:set string="Iroquois Land Deed">pitt_collection.114</padig:set>
		<padig:set string="Isaac and Samuel Miller Farm Account Book">pitt_collection.273</padig:set>
		<padig:set string="James Benney Photographs">pitt_collection.52</padig:set>
		<padig:set string="James Veech Copybook of the General William Irvine Papers">pitt_collection.22</padig:set>
		<padig:set string="Jewish Sports Hall of Fame of Western Pennsylvania Photographs">pitt_collection.54</padig:set>
		<padig:set string="Joel B. Levinson Photographs">pitt_collection.305</padig:set>
		<padig:set string="John Gates Photographs">pitt_collection.55</padig:set>
		<padig:set string="John M. Tate, Jr. Collection of Notes, Pictures and Documents relating to the Harmony Society">pitt_collection.203</padig:set>
		<padig:set string="John Woodruff Scrapbooks">pitt_collection.184</padig:set>
		<padig:set string="Jonathan Forman Papers">pitt_collection.23</padig:set>
		<padig:set string="Jones &amp; Laughlin Steel Corporation Photographs">pitt_collection.56</padig:set>
		<padig:set string="Juniata Crossings House Records">pitt_collection.303</padig:set>
		<padig:set string="Kaufmann's Department Store Photographs">pitt_collection.318</padig:set>
		<padig:set string="Ken Kobus Collection">pitt_collection.57</padig:set>
		<padig:set string="Kingsley Association Records">pitt_collection.58</padig:set>
		<padig:set string="Lyon, Shorb &amp; Company Photographs">pitt_collection.59</padig:set>
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
		<padig:set string="Northern Liberties Bridge Company Ledger">pitt_collection.63</padig:set>
		<padig:set string="Northland Historical Image Collection">pitt_collection.64</padig:set>
		<padig:set string="Oakmont Historical Image Collection">pitt_collection.65</padig:set>
		<padig:set string="Ohio Company Papers">pitt_collection.25</padig:set>
		<padig:set string="Oliver M. Kaufmann Photograph Collection of the Irene Kaufmann Settlement">pitt_collection.66</padig:set>
		<padig:set string="Otto's Suburban Dairy Photographs">pitt_collection.67</padig:set>
		<padig:set string="PPG Industries Records">pitt_collection.291</padig:set>
		<padig:set string="Paul Lawrence Peeler Papers and Photographs">pitt_collection.315</padig:set>
		<padig:set string="Paul Slantis Photographs">pitt_collection.68</padig:set>
		<padig:set string="Pennsylvania Railroad Photographs">pitt_collection.69</padig:set>
		<padig:set string="Pitcairn Historical Society Image Collection">pitt_collection.70</padig:set>
		<padig:set string="Pittsburgh Bureau of Building Inspection Photographs">pitt_collection.155</padig:set>
		<padig:set string="Pittsburgh Census Tract Maps and Data">pitt_collection.329</padig:set>
		<padig:set string="Pittsburgh City Photographer Collection">pitt_collection.72</padig:set>
		<padig:set string="Pittsburgh Photographic Library Collection">pitt_collection.317</padig:set>
		<padig:set string="Pittsburgh Prints from the Collection of Wesley Pickard">pitt_collection.73</padig:set>
		<padig:set string="Pittsburgh Public Schools Photographs">pitt_collection.74</padig:set>
		<padig:set string="Pittsburgh Railways Company Records">pitt_collection.75</padig:set>
		<padig:set string="Pittsburgh Symphony Orchestra Posters">pitt_collection.150</padig:set>
		<padig:set string="Pittsburgh Theatre">pitt_collection.10</padig:set>
		<padig:set string="Pittsburgh Waste Book and Fort Pitt Trading Post Papers">pitt_collection.99</padig:set>
		<padig:set string="Pittsburgh and Lake Erie Railroad Company Records">pitt_collection.71</padig:set>
		<padig:set string="Pittsburgh, Fort Wayne, and Chicago Railway Company Photographs">pitt_collection.76</padig:set>
		<padig:set string="Point Park University Archives">pitt_collection.77</padig:set>
		<padig:set string="Progress Photographs: William Penn Hotel">pitt_collection.78</padig:set>
		<padig:set string="Rachel Carson Collection">pitt_collection.238</padig:set>
		<padig:set string="Railroad Stock Certificate Collection">pitt_collection.250</padig:set>
		<padig:set string="Richard E. Rauh Photographs">pitt_collection.87</padig:set>
		<padig:set string="Robert G. Pflaum Photograph Collection">pitt_collection.147</padig:set>
		<padig:set string="Robert McKnight Diaries">pitt_collection.26</padig:set>
		<padig:set string="Robert Stobo Papers">pitt_collection.27</padig:set>
		<padig:set string="Rodef Shalom Congregation Photographs">pitt_collection.79</padig:set>
		<padig:set string="Rolling Rock Training Camp Ledger">pitt_collection.28</padig:set>
		<padig:set string="Russell H. Heffley Photographs">pitt_collection.148</padig:set>
		<padig:set string="Rust Engineering Company Records">pitt_collection.80</padig:set>
		<padig:set string="Samuel A. Musgrave Photographs">pitt_collection.289</padig:set>
		<padig:set string="Schnabel Company Photographs">pitt_collection.313</padig:set>
		<padig:set string="Seder Family Photographs">pitt_collection.81</padig:set>
		<padig:set string="Smoke Control Lantern Slides">pitt_collection.82</padig:set>
		<padig:set string="Spencer Family Photographs">pitt_collection.83</padig:set>
		<padig:set string="Tax-Book of Pitt Township, Allegheny County, Pa.">pitt_collection.84</padig:set>
		<padig:set string="Teenie Harris Photographs">pitt_collection.85</padig:set>
		<padig:set string="The Bulletin, Pittsburg Bulletin, and The Bulletin Index">pitt_collection.324</padig:set>
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
		<padig:set string="William V. Winans Jr. Photographs">pitt_collection.96</padig:set>
		<padig:set string="Woman's Christian Temperance Union, Wilkinsburg, Pa. Records">pitt_collection.205</padig:set>
    </xsl:param>
    
    <!-- lookup table for recommended Lexvo Languages terms/URIs -->
    <xsl:param name="lexvoLang">
      <padig:language string="aar" uri="http://lexvo.org/id/iso639-3/aar">aar</padig:language>
      <padig:language string="abk" uri="http://lexvo.org/id/iso639-3/abk">abk</padig:language>
      <padig:language string="ace" uri="http://lexvo.org/id/iso639-3/ace">ace</padig:language>``
      <padig:language string="ach" uri="http://lexvo.org/id/iso639-3/ach">ach</padig:language>
      <padig:language string="ada" uri="http://lexvo.org/id/iso639-3/ada">ada</padig:language>
      <padig:language string="ady" uri="http://lexvo.org/id/iso639-3/ady">ady</padig:language>
      <padig:language string="afa" uri="http://lexvo.org/id/iso639-5/afa">afa</padig:language>
      <padig:language string="afh" uri="http://lexvo.org/id/iso639-3/afh">afh</padig:language>
      <padig:language string="afr" uri="http://lexvo.org/id/iso639-3/afr">afr</padig:language>
      <padig:language string="ain" uri="http://lexvo.org/id/iso639-3/ain">ain</padig:language>
      <padig:language string="aka" uri="http://lexvo.org/id/iso639-3/aka">aka</padig:language>
      <padig:language string="akk" uri="http://lexvo.org/id/iso639-3/akk">akk</padig:language>
      <padig:language string="alb" uri="http://lexvo.org/id/iso639-3/sqi">alb</padig:language>
      <padig:language string="ale" uri="http://lexvo.org/id/iso639-3/ale">ale</padig:language>
      <padig:language string="alg" uri="http://lexvo.org/id/iso639-5/alg">alg</padig:language>
      <padig:language string="alt" uri="http://lexvo.org/id/iso639-3/alt">alt</padig:language>
      <padig:language string="amh" uri="http://lexvo.org/id/iso639-3/amh">amh</padig:language>
      <padig:language string="ang" uri="http://lexvo.org/id/iso639-3/ang">ang</padig:language>
      <padig:language string="anp" uri="http://lexvo.org/id/iso639-3/anp">anp</padig:language>
      <padig:language string="apa" uri="http://lexvo.org/id/iso639-5/apa">apa</padig:language>
      <padig:language string="ara" uri="http://lexvo.org/id/iso639-3/ara">ara</padig:language>
      <padig:language string="arc" uri="http://lexvo.org/id/iso639-3/arc">arc</padig:language>
      <padig:language string="arg" uri="http://lexvo.org/id/iso639-3/arg">arg</padig:language>
      <padig:language string="arm" uri="http://lexvo.org/id/iso639-3/hye">arm</padig:language>
      <padig:language string="arn" uri="http://lexvo.org/id/iso639-3/arn">arn</padig:language>
      <padig:language string="arp" uri="http://lexvo.org/id/iso639-3/arp">arp</padig:language>
      <padig:language string="art" uri="http://lexvo.org/id/iso639-5/art">art</padig:language>
      <padig:language string="arw" uri="http://lexvo.org/id/iso639-3/arw">arw</padig:language>
      <padig:language string="asm" uri="http://lexvo.org/id/iso639-3/asm">asm</padig:language>
      <padig:language string="ast" uri="http://lexvo.org/id/iso639-3/ast">ast</padig:language>
      <padig:language string="ath" uri="http://lexvo.org/id/iso639-5/ath">ath</padig:language>
      <padig:language string="aus" uri="http://lexvo.org/id/iso639-5/aus">aus</padig:language>
      <padig:language string="ava" uri="http://lexvo.org/id/iso639-3/ava">ava</padig:language>
      <padig:language string="ave" uri="http://lexvo.org/id/iso639-3/ave">ave</padig:language>
      <padig:language string="awa" uri="http://lexvo.org/id/iso639-3/awa">awa</padig:language>
      <padig:language string="aym" uri="http://lexvo.org/id/iso639-3/aym">aym</padig:language>
      <padig:language string="aze" uri="http://lexvo.org/id/iso639-3/aze">aze</padig:language>
      <padig:language string="bad" uri="http://lexvo.org/id/iso639-5/bad">bad</padig:language>
      <padig:language string="bai" uri="http://lexvo.org/id/iso639-5/bai">bai</padig:language>
      <padig:language string="bak" uri="http://lexvo.org/id/iso639-3/bak">bak</padig:language>
      <padig:language string="bal" uri="http://lexvo.org/id/iso639-3/bal">bal</padig:language>
      <padig:language string="bam" uri="http://lexvo.org/id/iso639-3/bam">bam</padig:language>
      <padig:language string="ban" uri="http://lexvo.org/id/iso639-3/ban">ban</padig:language>
      <padig:language string="baq" uri="http://lexvo.org/id/iso639-3/eus">baq</padig:language>
      <padig:language string="bas" uri="http://lexvo.org/id/iso639-3/bas">bas</padig:language>
      <padig:language string="bat" uri="http://lexvo.org/id/iso639-5/bat">bat</padig:language>
      <padig:language string="bej" uri="http://lexvo.org/id/iso639-3/bej">bej</padig:language>
      <padig:language string="bel" uri="http://lexvo.org/id/iso639-3/bel">bel</padig:language>
      <padig:language string="bem" uri="http://lexvo.org/id/iso639-3/bem">bem</padig:language>
      <padig:language string="ben" uri="http://lexvo.org/id/iso639-3/ben">ben</padig:language>
      <padig:language string="ber" uri="http://lexvo.org/id/iso639-5/ber">ber</padig:language>
      <padig:language string="bho" uri="http://lexvo.org/id/iso639-3/bho">bho</padig:language>
      <padig:language string="bik" uri="http://lexvo.org/id/iso639-3/bik">bik</padig:language>
      <padig:language string="bin" uri="http://lexvo.org/id/iso639-3/bin">bin</padig:language>
      <padig:language string="bis" uri="http://lexvo.org/id/iso639-3/bis">bis</padig:language>
      <padig:language string="bla" uri="http://lexvo.org/id/iso639-3/bla">bla</padig:language>
      <padig:language string="bnt" uri="http://lexvo.org/id/iso639-5/bnt">bnt</padig:language>
      <padig:language string="bod" uri="http://lexvo.org/id/iso639-3/bod">bod</padig:language>
      <padig:language string="bos" uri="http://lexvo.org/id/iso639-3/bos">bos</padig:language>
      <padig:language string="bra" uri="http://lexvo.org/id/iso639-3/bra">bra</padig:language>
      <padig:language string="bre" uri="http://lexvo.org/id/iso639-3/bre">bre</padig:language>
      <padig:language string="btk" uri="http://lexvo.org/id/iso639-5/btk">btk</padig:language>
      <padig:language string="bua" uri="http://lexvo.org/id/iso639-3/bua">bua</padig:language>
      <padig:language string="bug" uri="http://lexvo.org/id/iso639-3/bug">bug</padig:language>
      <padig:language string="bul" uri="http://lexvo.org/id/iso639-3/bul">bul</padig:language>
      <padig:language string="bur" uri="http://lexvo.org/id/iso639-3/mya">bur</padig:language>
      <padig:language string="byn" uri="http://lexvo.org/id/iso639-3/byn">byn</padig:language>
      <padig:language string="cad" uri="http://lexvo.org/id/iso639-3/cad">cad</padig:language>
      <padig:language string="cai" uri="http://lexvo.org/id/iso639-5/cai">cai</padig:language>
      <padig:language string="car" uri="http://lexvo.org/id/iso639-3/car">car</padig:language>
      <padig:language string="cat" uri="http://lexvo.org/id/iso639-3/cat">cat</padig:language>
      <padig:language string="cau" uri="http://lexvo.org/id/iso639-5/cau">cau</padig:language>
      <padig:language string="ceb" uri="http://lexvo.org/id/iso639-3/ceb">ceb</padig:language>
      <padig:language string="cel" uri="http://lexvo.org/id/iso639-5/cel">cel</padig:language>
      <padig:language string="ces" uri="http://lexvo.org/id/iso639-3/ces">ces</padig:language>
      <padig:language string="cha" uri="http://lexvo.org/id/iso639-3/cha">cha</padig:language>
      <padig:language string="chb" uri="http://lexvo.org/id/iso639-3/chb">chb</padig:language>
      <padig:language string="che" uri="http://lexvo.org/id/iso639-3/che">che</padig:language>
      <padig:language string="chg" uri="http://lexvo.org/id/iso639-3/chg">chg</padig:language>
      <padig:language string="chi" uri="http://lexvo.org/id/iso639-3/zho">chi</padig:language>
      <padig:language string="chk" uri="http://lexvo.org/id/iso639-3/chk">chk</padig:language>
      <padig:language string="chm" uri="http://lexvo.org/id/iso639-3/chm">chm</padig:language>
      <padig:language string="chn" uri="http://lexvo.org/id/iso639-3/chn">chn</padig:language>
      <padig:language string="cho" uri="http://lexvo.org/id/iso639-3/cho">cho</padig:language>
      <padig:language string="chp" uri="http://lexvo.org/id/iso639-3/chp">chp</padig:language>
      <padig:language string="chr" uri="http://lexvo.org/id/iso639-3/chr">chr</padig:language>
      <padig:language string="chu" uri="http://lexvo.org/id/iso639-3/chu">chu</padig:language>
      <padig:language string="chv" uri="http://lexvo.org/id/iso639-3/chv">chv</padig:language>
      <padig:language string="chy" uri="http://lexvo.org/id/iso639-3/chy">chy</padig:language>
      <padig:language string="cmc" uri="http://lexvo.org/id/iso639-5/cmc">cmc</padig:language>
      <padig:language string="cop" uri="http://lexvo.org/id/iso639-3/cop">cop</padig:language>
      <padig:language string="cor" uri="http://lexvo.org/id/iso639-3/cor">cor</padig:language>
      <padig:language string="cos" uri="http://lexvo.org/id/iso639-3/cos">cos</padig:language>
      <padig:language string="cpe" uri="http://lexvo.org/id/iso639-5/cpe">cpe</padig:language>
      <padig:language string="cpf" uri="http://lexvo.org/id/iso639-5/cpf">cpf</padig:language>
      <padig:language string="cpp" uri="http://lexvo.org/id/iso639-5/cpp">cpp</padig:language>
      <padig:language string="cre" uri="http://lexvo.org/id/iso639-3/cre">cre</padig:language>
      <padig:language string="crh" uri="http://lexvo.org/id/iso639-3/crh">crh</padig:language>
      <padig:language string="crp" uri="http://lexvo.org/id/iso639-5/crp">crp</padig:language>
      <padig:language string="csb" uri="http://lexvo.org/id/iso639-3/csb">csb</padig:language>
      <padig:language string="cus" uri="http://lexvo.org/id/iso639-5/cus">cus</padig:language>
      <padig:language string="cym" uri="http://lexvo.org/id/iso639-3/cym">cym</padig:language>
      <padig:language string="cze" uri="http://lexvo.org/id/iso639-3/ces">cze</padig:language>
      <padig:language string="dak" uri="http://lexvo.org/id/iso639-3/dak">dak</padig:language>
      <padig:language string="dan" uri="http://lexvo.org/id/iso639-3/dan">dan</padig:language>
      <padig:language string="dar" uri="http://lexvo.org/id/iso639-3/dar">dar</padig:language>
      <padig:language string="day" uri="http://lexvo.org/id/iso639-5/day">day</padig:language>
      <padig:language string="del" uri="http://lexvo.org/id/iso639-3/del">del</padig:language>
      <padig:language string="den" uri="http://lexvo.org/id/iso639-3/den">den</padig:language>
      <padig:language string="deu" uri="http://lexvo.org/id/iso639-3/deu">deu</padig:language>
      <padig:language string="dgr" uri="http://lexvo.org/id/iso639-3/dgr">dgr</padig:language>
      <padig:language string="din" uri="http://lexvo.org/id/iso639-3/din">din</padig:language>
      <padig:language string="div" uri="http://lexvo.org/id/iso639-3/div">div</padig:language>
      <padig:language string="doi" uri="http://lexvo.org/id/iso639-3/doi">doi</padig:language>
      <padig:language string="dra" uri="http://lexvo.org/id/iso639-5/dra">dra</padig:language>
      <padig:language string="dsb" uri="http://lexvo.org/id/iso639-3/dsb">dsb</padig:language>
      <padig:language string="dua" uri="http://lexvo.org/id/iso639-3/dua">dua</padig:language>
      <padig:language string="dum" uri="http://lexvo.org/id/iso639-3/dum">dum</padig:language>
      <padig:language string="dut" uri="http://lexvo.org/id/iso639-3/nld">dut</padig:language>
      <padig:language string="dyu" uri="http://lexvo.org/id/iso639-3/dyu">dyu</padig:language>
      <padig:language string="dzo" uri="http://lexvo.org/id/iso639-3/dzo">dzo</padig:language>
      <padig:language string="efi" uri="http://lexvo.org/id/iso639-3/efi">efi</padig:language>
      <padig:language string="egy" uri="http://lexvo.org/id/iso639-3/egy">egy</padig:language>
      <padig:language string="eka" uri="http://lexvo.org/id/iso639-3/eka">eka</padig:language>
      <padig:language string="ell" uri="http://lexvo.org/id/iso639-3/ell">ell</padig:language>
      <padig:language string="elx" uri="http://lexvo.org/id/iso639-3/elx">elx</padig:language>
      <padig:language string="eng" uri="http://lexvo.org/id/iso639-3/eng">eng</padig:language>
      <padig:language string="enm" uri="http://lexvo.org/id/iso639-3/enm">enm</padig:language>
      <padig:language string="epo" uri="http://lexvo.org/id/iso639-3/epo">epo</padig:language>
      <padig:language string="est" uri="http://lexvo.org/id/iso639-3/est">est</padig:language>
      <padig:language string="eus" uri="http://lexvo.org/id/iso639-3/eus">eus</padig:language>
      <padig:language string="ewe" uri="http://lexvo.org/id/iso639-3/ewe">ewe</padig:language>
      <padig:language string="ewo" uri="http://lexvo.org/id/iso639-3/ewo">ewo</padig:language>
      <padig:language string="fan" uri="http://lexvo.org/id/iso639-3/fan">fan</padig:language>
      <padig:language string="fao" uri="http://lexvo.org/id/iso639-3/fao">fao</padig:language>
      <padig:language string="fas" uri="http://lexvo.org/id/iso639-3/fas">fas</padig:language>
      <padig:language string="fat" uri="http://lexvo.org/id/iso639-3/fat">fat</padig:language>
      <padig:language string="fij" uri="http://lexvo.org/id/iso639-3/fij">fij</padig:language>
      <padig:language string="fil" uri="http://lexvo.org/id/iso639-3/fil">fil</padig:language>
      <padig:language string="fin" uri="http://lexvo.org/id/iso639-3/fin">fin</padig:language>
      <padig:language string="fiu" uri="http://lexvo.org/id/iso639-5/fiu">fiu</padig:language>
      <padig:language string="fon" uri="http://lexvo.org/id/iso639-3/fon">fon</padig:language>
      <padig:language string="fra" uri="http://lexvo.org/id/iso639-3/fra">fra</padig:language>
      <padig:language string="fre" uri="http://lexvo.org/id/iso639-3/fra">fre</padig:language>
      <padig:language string="frm" uri="http://lexvo.org/id/iso639-3/frm">frm</padig:language>
      <padig:language string="fro" uri="http://lexvo.org/id/iso639-3/fro">fro</padig:language>
      <padig:language string="frr" uri="http://lexvo.org/id/iso639-3/frr">frr</padig:language>
      <padig:language string="frs" uri="http://lexvo.org/id/iso639-3/frs">frs</padig:language>
      <padig:language string="fry" uri="http://lexvo.org/id/iso639-3/fry">fry</padig:language>
      <padig:language string="ful" uri="http://lexvo.org/id/iso639-3/ful">ful</padig:language>
      <padig:language string="fur" uri="http://lexvo.org/id/iso639-3/fur">fur</padig:language>
      <padig:language string="gaa" uri="http://lexvo.org/id/iso639-3/gaa">gaa</padig:language>
      <padig:language string="gay" uri="http://lexvo.org/id/iso639-3/gay">gay</padig:language>
      <padig:language string="gba" uri="http://lexvo.org/id/iso639-3/gba">gba</padig:language>
      <padig:language string="gem" uri="http://lexvo.org/id/iso639-5/gem">gem</padig:language>
      <padig:language string="geo" uri="http://lexvo.org/id/iso639-3/kat">geo</padig:language>
      <padig:language string="ger" uri="http://lexvo.org/id/iso639-3/deu">ger</padig:language>
      <padig:language string="gez" uri="http://lexvo.org/id/iso639-3/gez">gez</padig:language>
      <padig:language string="gil" uri="http://lexvo.org/id/iso639-3/gil">gil</padig:language>
      <padig:language string="gla" uri="http://lexvo.org/id/iso639-3/gla">gla</padig:language>
      <padig:language string="gle" uri="http://lexvo.org/id/iso639-3/gle">gle</padig:language>
      <padig:language string="glg" uri="http://lexvo.org/id/iso639-3/glg">glg</padig:language>
      <padig:language string="glv" uri="http://lexvo.org/id/iso639-3/glv">glv</padig:language>
      <padig:language string="gmh" uri="http://lexvo.org/id/iso639-3/gmh">gmh</padig:language>
      <padig:language string="goh" uri="http://lexvo.org/id/iso639-3/goh">goh</padig:language>
      <padig:language string="gon" uri="http://lexvo.org/id/iso639-3/gon">gon</padig:language>
      <padig:language string="gor" uri="http://lexvo.org/id/iso639-3/gor">gor</padig:language>
      <padig:language string="got" uri="http://lexvo.org/id/iso639-3/got">got</padig:language>
      <padig:language string="grb" uri="http://lexvo.org/id/iso639-3/grb">grb</padig:language>
      <padig:language string="grc" uri="http://lexvo.org/id/iso639-3/grc">grc</padig:language>
      <padig:language string="gre" uri="http://lexvo.org/id/iso639-3/ell">gre</padig:language>
      <padig:language string="grn" uri="http://lexvo.org/id/iso639-3/grn">grn</padig:language>
      <padig:language string="gsw" uri="http://lexvo.org/id/iso639-3/gsw">gsw</padig:language>
      <padig:language string="guj" uri="http://lexvo.org/id/iso639-3/guj">guj</padig:language>
      <padig:language string="gwi" uri="http://lexvo.org/id/iso639-3/gwi">gwi</padig:language>
      <padig:language string="hai" uri="http://lexvo.org/id/iso639-3/hai">hai</padig:language>
      <padig:language string="hat" uri="http://lexvo.org/id/iso639-3/hat">hat</padig:language>
      <padig:language string="hau" uri="http://lexvo.org/id/iso639-3/hau">hau</padig:language>
      <padig:language string="haw" uri="http://lexvo.org/id/iso639-3/haw">haw</padig:language>
      <padig:language string="heb" uri="http://lexvo.org/id/iso639-3/heb">heb</padig:language>
      <padig:language string="her" uri="http://lexvo.org/id/iso639-3/her">her</padig:language>
      <padig:language string="hil" uri="http://lexvo.org/id/iso639-3/hil">hil</padig:language>
      <padig:language string="hin" uri="http://lexvo.org/id/iso639-3/hin">hin</padig:language>
      <padig:language string="hit" uri="http://lexvo.org/id/iso639-3/hit">hit</padig:language>
      <padig:language string="hmn" uri="http://lexvo.org/id/iso639-3/hmn">hmn</padig:language>
      <padig:language string="hmo" uri="http://lexvo.org/id/iso639-3/hmo">hmo</padig:language>
      <padig:language string="hrv" uri="http://lexvo.org/id/iso639-3/hrv">hrv</padig:language>
      <padig:language string="hsb" uri="http://lexvo.org/id/iso639-3/hsb">hsb</padig:language>
      <padig:language string="hun" uri="http://lexvo.org/id/iso639-3/hun">hun</padig:language>
      <padig:language string="hup" uri="http://lexvo.org/id/iso639-3/hup">hup</padig:language>
      <padig:language string="hye" uri="http://lexvo.org/id/iso639-3/hye">hye</padig:language>
      <padig:language string="iba" uri="http://lexvo.org/id/iso639-3/iba">iba</padig:language>
      <padig:language string="ibo" uri="http://lexvo.org/id/iso639-3/ibo">ibo</padig:language>
      <padig:language string="ice" uri="http://lexvo.org/id/iso639-3/isl">ice</padig:language>
      <padig:language string="ido" uri="http://lexvo.org/id/iso639-3/ido">ido</padig:language>
      <padig:language string="iii" uri="http://lexvo.org/id/iso639-3/iii">iii</padig:language>
      <padig:language string="ijo" uri="http://lexvo.org/id/iso639-5/ijo">ijo</padig:language>
      <padig:language string="iku" uri="http://lexvo.org/id/iso639-3/iku">iku</padig:language>
      <padig:language string="ile" uri="http://lexvo.org/id/iso639-3/ile">ile</padig:language>
      <padig:language string="ilo" uri="http://lexvo.org/id/iso639-3/ilo">ilo</padig:language>
      <padig:language string="ina" uri="http://lexvo.org/id/iso639-3/ina">ina</padig:language>
      <padig:language string="inc" uri="http://lexvo.org/id/iso639-5/inc">inc</padig:language>
      <padig:language string="ind" uri="http://lexvo.org/id/iso639-3/ind">ind</padig:language>
      <padig:language string="ine" uri="http://lexvo.org/id/iso639-5/ine">ine</padig:language>
      <padig:language string="inh" uri="http://lexvo.org/id/iso639-3/inh">inh</padig:language>
      <padig:language string="ipk" uri="http://lexvo.org/id/iso639-3/ipk">ipk</padig:language>
      <padig:language string="ira" uri="http://lexvo.org/id/iso639-5/ira">ira</padig:language>
      <padig:language string="iro" uri="http://lexvo.org/id/iso639-5/iro">iro</padig:language>
      <padig:language string="isl" uri="http://lexvo.org/id/iso639-3/isl">isl</padig:language>
      <padig:language string="ita" uri="http://lexvo.org/id/iso639-3/ita">ita</padig:language>
      <padig:language string="jav" uri="http://lexvo.org/id/iso639-3/jav">jav</padig:language>
      <padig:language string="jbo" uri="http://lexvo.org/id/iso639-3/jbo">jbo</padig:language>
      <padig:language string="jpn" uri="http://lexvo.org/id/iso639-3/jpn">jpn</padig:language>
      <padig:language string="jpr" uri="http://lexvo.org/id/iso639-3/jpr">jpr</padig:language>
      <padig:language string="jrb" uri="http://lexvo.org/id/iso639-3/jrb">jrb</padig:language>
      <padig:language string="kaa" uri="http://lexvo.org/id/iso639-3/kaa">kaa</padig:language>
      <padig:language string="kab" uri="http://lexvo.org/id/iso639-3/kab">kab</padig:language>
      <padig:language string="kac" uri="http://lexvo.org/id/iso639-3/kac">kac</padig:language>
      <padig:language string="kal" uri="http://lexvo.org/id/iso639-3/kal">kal</padig:language>
      <padig:language string="kam" uri="http://lexvo.org/id/iso639-3/kam">kam</padig:language>
      <padig:language string="kan" uri="http://lexvo.org/id/iso639-3/kan">kan</padig:language>
      <padig:language string="kar" uri="http://lexvo.org/id/iso639-5/kar">kar</padig:language>
      <padig:language string="kas" uri="http://lexvo.org/id/iso639-3/kas">kas</padig:language>
      <padig:language string="kat" uri="http://lexvo.org/id/iso639-3/kat">kat</padig:language>
      <padig:language string="kau" uri="http://lexvo.org/id/iso639-3/kau">kau</padig:language>
      <padig:language string="kaw" uri="http://lexvo.org/id/iso639-3/kaw">kaw</padig:language>
      <padig:language string="kaz" uri="http://lexvo.org/id/iso639-3/kaz">kaz</padig:language>
      <padig:language string="kbd" uri="http://lexvo.org/id/iso639-3/kbd">kbd</padig:language>
      <padig:language string="kha" uri="http://lexvo.org/id/iso639-3/kha">kha</padig:language>
      <padig:language string="khi" uri="http://lexvo.org/id/iso639-5/khi">khi</padig:language>
      <padig:language string="khm" uri="http://lexvo.org/id/iso639-3/khm">khm</padig:language>
      <padig:language string="kho" uri="http://lexvo.org/id/iso639-3/kho">kho</padig:language>
      <padig:language string="kik" uri="http://lexvo.org/id/iso639-3/kik">kik</padig:language>
      <padig:language string="kin" uri="http://lexvo.org/id/iso639-3/kin">kin</padig:language>
      <padig:language string="kir" uri="http://lexvo.org/id/iso639-3/kir">kir</padig:language>
      <padig:language string="kmb" uri="http://lexvo.org/id/iso639-3/kmb">kmb</padig:language>
      <padig:language string="kok" uri="http://lexvo.org/id/iso639-3/kok">kok</padig:language>
      <padig:language string="kom" uri="http://lexvo.org/id/iso639-3/kom">kom</padig:language>
      <padig:language string="kon" uri="http://lexvo.org/id/iso639-3/kon">kon</padig:language>
      <padig:language string="kor" uri="http://lexvo.org/id/iso639-3/kor">kor</padig:language>
      <padig:language string="kos" uri="http://lexvo.org/id/iso639-3/kos">kos</padig:language>
      <padig:language string="kpe" uri="http://lexvo.org/id/iso639-3/kpe">kpe</padig:language>
      <padig:language string="krc" uri="http://lexvo.org/id/iso639-3/krc">krc</padig:language>
      <padig:language string="krl" uri="http://lexvo.org/id/iso639-3/krl">krl</padig:language>
      <padig:language string="kro" uri="http://lexvo.org/id/iso639-5/kro">kro</padig:language>
      <padig:language string="kru" uri="http://lexvo.org/id/iso639-3/kru">kru</padig:language>
      <padig:language string="kua" uri="http://lexvo.org/id/iso639-3/kua">kua</padig:language>
      <padig:language string="kum" uri="http://lexvo.org/id/iso639-3/kum">kum</padig:language>
      <padig:language string="kur" uri="http://lexvo.org/id/iso639-3/kur">kur</padig:language>
      <padig:language string="kut" uri="http://lexvo.org/id/iso639-3/kut">kut</padig:language>
      <padig:language string="lad" uri="http://lexvo.org/id/iso639-3/lad">lad</padig:language>
      <padig:language string="lah" uri="http://lexvo.org/id/iso639-3/lah">lah</padig:language>
      <padig:language string="lam" uri="http://lexvo.org/id/iso639-3/lam">lam</padig:language>
      <padig:language string="lao" uri="http://lexvo.org/id/iso639-3/lao">lao</padig:language>
      <padig:language string="lat" uri="http://lexvo.org/id/iso639-3/lat">lat</padig:language>
      <padig:language string="lav" uri="http://lexvo.org/id/iso639-3/lav">lav</padig:language>
      <padig:language string="lez" uri="http://lexvo.org/id/iso639-3/lez">lez</padig:language>
      <padig:language string="lim" uri="http://lexvo.org/id/iso639-3/lim">lim</padig:language>
      <padig:language string="lin" uri="http://lexvo.org/id/iso639-3/lin">lin</padig:language>
      <padig:language string="lit" uri="http://lexvo.org/id/iso639-3/lit">lit</padig:language>
      <padig:language string="lol" uri="http://lexvo.org/id/iso639-3/lol">lol</padig:language>
      <padig:language string="loz" uri="http://lexvo.org/id/iso639-3/loz">loz</padig:language>
      <padig:language string="ltz" uri="http://lexvo.org/id/iso639-3/ltz">ltz</padig:language>
      <padig:language string="lua" uri="http://lexvo.org/id/iso639-3/lua">lua</padig:language>
      <padig:language string="lub" uri="http://lexvo.org/id/iso639-3/lub">lub</padig:language>
      <padig:language string="lug" uri="http://lexvo.org/id/iso639-3/lug">lug</padig:language>
      <padig:language string="lui" uri="http://lexvo.org/id/iso639-3/lui">lui</padig:language>
      <padig:language string="lun" uri="http://lexvo.org/id/iso639-3/lun">lun</padig:language>
      <padig:language string="luo" uri="http://lexvo.org/id/iso639-3/luo">luo</padig:language>
      <padig:language string="lus" uri="http://lexvo.org/id/iso639-3/lus">lus</padig:language>
      <padig:language string="mac" uri="http://lexvo.org/id/iso639-3/mkd">mac</padig:language>
      <padig:language string="mad" uri="http://lexvo.org/id/iso639-3/mad">mad</padig:language>
      <padig:language string="mag" uri="http://lexvo.org/id/iso639-3/mag">mag</padig:language>
      <padig:language string="mah" uri="http://lexvo.org/id/iso639-3/mah">mah</padig:language>
      <padig:language string="mai" uri="http://lexvo.org/id/iso639-3/mai">mai</padig:language>
      <padig:language string="mak" uri="http://lexvo.org/id/iso639-3/mak">mak</padig:language>
      <padig:language string="mal" uri="http://lexvo.org/id/iso639-3/mal">mal</padig:language>
      <padig:language string="man" uri="http://lexvo.org/id/iso639-3/man">man</padig:language>
      <padig:language string="mao" uri="http://lexvo.org/id/iso639-3/mri">mao</padig:language>
      <padig:language string="map" uri="http://lexvo.org/id/iso639-5/map">map</padig:language>
      <padig:language string="mar" uri="http://lexvo.org/id/iso639-3/mar">mar</padig:language>
      <padig:language string="mas" uri="http://lexvo.org/id/iso639-3/mas">mas</padig:language>
      <padig:language string="may" uri="http://lexvo.org/id/iso639-3/msa">may</padig:language>
      <padig:language string="mdf" uri="http://lexvo.org/id/iso639-3/mdf">mdf</padig:language>
      <padig:language string="mdr" uri="http://lexvo.org/id/iso639-3/mdr">mdr</padig:language>
      <padig:language string="men" uri="http://lexvo.org/id/iso639-3/men">men</padig:language>
      <padig:language string="mga" uri="http://lexvo.org/id/iso639-3/mga">mga</padig:language>
      <padig:language string="mic" uri="http://lexvo.org/id/iso639-3/mic">mic</padig:language>
      <padig:language string="min" uri="http://lexvo.org/id/iso639-3/min">min</padig:language>
      <padig:language string="mis" uri="http://lexvo.org/id/iso639-3/mis">mis</padig:language>
      <padig:language string="mkd" uri="http://lexvo.org/id/iso639-3/mkd">mkd</padig:language>
      <padig:language string="mkh" uri="http://lexvo.org/id/iso639-5/mkh">mkh</padig:language>
      <padig:language string="mlg" uri="http://lexvo.org/id/iso639-3/mlg">mlg</padig:language>
      <padig:language string="mlt" uri="http://lexvo.org/id/iso639-3/mlt">mlt</padig:language>
      <padig:language string="mnc" uri="http://lexvo.org/id/iso639-3/mnc">mnc</padig:language>
      <padig:language string="mni" uri="http://lexvo.org/id/iso639-3/mni">mni</padig:language>
      <padig:language string="mno" uri="http://lexvo.org/id/iso639-5/mno">mno</padig:language>
      <padig:language string="moh" uri="http://lexvo.org/id/iso639-3/moh">moh</padig:language>
      <padig:language string="mon" uri="http://lexvo.org/id/iso639-3/mon">mon</padig:language>
      <padig:language string="mos" uri="http://lexvo.org/id/iso639-3/mos">mos</padig:language>
      <padig:language string="mri" uri="http://lexvo.org/id/iso639-3/mri">mri</padig:language>
      <padig:language string="msa" uri="http://lexvo.org/id/iso639-3/msa">msa</padig:language>
      <padig:language string="mul" uri="http://lexvo.org/id/iso639-3/mul">mul</padig:language>
      <padig:language string="mun" uri="http://lexvo.org/id/iso639-5/mun">mun</padig:language>
      <padig:language string="mus" uri="http://lexvo.org/id/iso639-3/mus">mus</padig:language>
      <padig:language string="mwl" uri="http://lexvo.org/id/iso639-3/mwl">mwl</padig:language>
      <padig:language string="mwr" uri="http://lexvo.org/id/iso639-3/mwr">mwr</padig:language>
      <padig:language string="mya" uri="http://lexvo.org/id/iso639-3/mya">mya</padig:language>
      <padig:language string="myn" uri="http://lexvo.org/id/iso639-5/myn">myn</padig:language>
      <padig:language string="myv" uri="http://lexvo.org/id/iso639-3/myv">myv</padig:language>
      <padig:language string="nah" uri="http://lexvo.org/id/iso639-5/nah">nah</padig:language>
      <padig:language string="nai" uri="http://lexvo.org/id/iso639-5/nai">nai</padig:language>
      <padig:language string="nap" uri="http://lexvo.org/id/iso639-3/nap">nap</padig:language>
      <padig:language string="nau" uri="http://lexvo.org/id/iso639-3/nau">nau</padig:language>
      <padig:language string="nav" uri="http://lexvo.org/id/iso639-3/nav">nav</padig:language>
      <padig:language string="nbl" uri="http://lexvo.org/id/iso639-3/nbl">nbl</padig:language>
      <padig:language string="nde" uri="http://lexvo.org/id/iso639-3/nde">nde</padig:language>
      <padig:language string="ndo" uri="http://lexvo.org/id/iso639-3/ndo">ndo</padig:language>
      <padig:language string="nds" uri="http://lexvo.org/id/iso639-3/nds">nds</padig:language>
      <padig:language string="nep" uri="http://lexvo.org/id/iso639-3/nep">nep</padig:language>
      <padig:language string="new" uri="http://lexvo.org/id/iso639-3/new">new</padig:language>
      <padig:language string="nia" uri="http://lexvo.org/id/iso639-3/nia">nia</padig:language>
      <padig:language string="nic" uri="http://lexvo.org/id/iso639-5/nic">nic</padig:language>
      <padig:language string="niu" uri="http://lexvo.org/id/iso639-3/niu">niu</padig:language>
      <padig:language string="nld" uri="http://lexvo.org/id/iso639-3/nld">nld</padig:language>
      <padig:language string="nno" uri="http://lexvo.org/id/iso639-3/nno">nno</padig:language>
      <padig:language string="nob" uri="http://lexvo.org/id/iso639-3/nob">nob</padig:language>
      <padig:language string="nog" uri="http://lexvo.org/id/iso639-3/nog">nog</padig:language>
      <padig:language string="non" uri="http://lexvo.org/id/iso639-3/non">non</padig:language>
      <padig:language string="nor" uri="http://lexvo.org/id/iso639-3/nor">nor</padig:language>
      <padig:language string="nqo" uri="http://lexvo.org/id/iso639-3/nqo">nqo</padig:language>
      <padig:language string="nso" uri="http://lexvo.org/id/iso639-3/nso">nso</padig:language>
      <padig:language string="nub" uri="http://lexvo.org/id/iso639-5/nub">nub</padig:language>
      <padig:language string="nwc" uri="http://lexvo.org/id/iso639-3/nwc">nwc</padig:language>
      <padig:language string="nya" uri="http://lexvo.org/id/iso639-3/nya">nya</padig:language>
      <padig:language string="nym" uri="http://lexvo.org/id/iso639-3/nym">nym</padig:language>
      <padig:language string="nyn" uri="http://lexvo.org/id/iso639-3/nyn">nyn</padig:language>
      <padig:language string="nyo" uri="http://lexvo.org/id/iso639-3/nyo">nyo</padig:language>
      <padig:language string="nzi" uri="http://lexvo.org/id/iso639-3/nzi">nzi</padig:language>
      <padig:language string="oci" uri="http://lexvo.org/id/iso639-3/oci">oci</padig:language>
      <padig:language string="oji" uri="http://lexvo.org/id/iso639-3/oji">oji</padig:language>
      <padig:language string="ori" uri="http://lexvo.org/id/iso639-3/ori">ori</padig:language>
      <padig:language string="orm" uri="http://lexvo.org/id/iso639-3/orm">orm</padig:language>
      <padig:language string="osa" uri="http://lexvo.org/id/iso639-3/osa">osa</padig:language>
      <padig:language string="oss" uri="http://lexvo.org/id/iso639-3/oss">oss</padig:language>
      <padig:language string="ota" uri="http://lexvo.org/id/iso639-3/ota">ota</padig:language>
      <padig:language string="oto" uri="http://lexvo.org/id/iso639-5/oto">oto</padig:language>
      <padig:language string="paa" uri="http://lexvo.org/id/iso639-5/paa">paa</padig:language>
      <padig:language string="pag" uri="http://lexvo.org/id/iso639-3/pag">pag</padig:language>
      <padig:language string="pal" uri="http://lexvo.org/id/iso639-3/pal">pal</padig:language>
      <padig:language string="pam" uri="http://lexvo.org/id/iso639-3/pam">pam</padig:language>
      <padig:language string="pan" uri="http://lexvo.org/id/iso639-3/pan">pan</padig:language>
      <padig:language string="pap" uri="http://lexvo.org/id/iso639-3/pap">pap</padig:language>
      <padig:language string="pau" uri="http://lexvo.org/id/iso639-3/pau">pau</padig:language>
      <padig:language string="peo" uri="http://lexvo.org/id/iso639-3/peo">peo</padig:language>
      <padig:language string="per" uri="http://lexvo.org/id/iso639-3/fas">per</padig:language>
      <padig:language string="phi" uri="http://lexvo.org/id/iso639-5/phi">phi</padig:language>
      <padig:language string="phn" uri="http://lexvo.org/id/iso639-3/phn">phn</padig:language>
      <padig:language string="pli" uri="http://lexvo.org/id/iso639-3/pli">pli</padig:language>
      <padig:language string="pol" uri="http://lexvo.org/id/iso639-3/pol">pol</padig:language>
      <padig:language string="pon" uri="http://lexvo.org/id/iso639-3/pon">pon</padig:language>
      <padig:language string="por" uri="http://lexvo.org/id/iso639-3/por">por</padig:language>
      <padig:language string="pra" uri="http://lexvo.org/id/iso639-5/pra">pra</padig:language>
      <padig:language string="pro" uri="http://lexvo.org/id/iso639-3/pro">pro</padig:language>
      <padig:language string="pus" uri="http://lexvo.org/id/iso639-3/pus">pus</padig:language>
      <padig:language string="que" uri="http://lexvo.org/id/iso639-3/que">que</padig:language>
      <padig:language string="raj" uri="http://lexvo.org/id/iso639-3/raj">raj</padig:language>
      <padig:language string="rap" uri="http://lexvo.org/id/iso639-3/rap">rap</padig:language>
      <padig:language string="rar" uri="http://lexvo.org/id/iso639-3/rar">rar</padig:language>
      <padig:language string="roa" uri="http://lexvo.org/id/iso639-5/roa">roa</padig:language>
      <padig:language string="roh" uri="http://lexvo.org/id/iso639-3/roh">roh</padig:language>
      <padig:language string="rom" uri="http://lexvo.org/id/iso639-3/rom">rom</padig:language>
      <padig:language string="ron" uri="http://lexvo.org/id/iso639-3/ron">ron</padig:language>
      <padig:language string="rum" uri="http://lexvo.org/id/iso639-3/ron">rum</padig:language>
      <padig:language string="run" uri="http://lexvo.org/id/iso639-3/run">run</padig:language>
      <padig:language string="rup" uri="http://lexvo.org/id/iso639-3/rup">rup</padig:language>
      <padig:language string="rus" uri="http://lexvo.org/id/iso639-3/rus">rus</padig:language>
      <padig:language string="sad" uri="http://lexvo.org/id/iso639-3/sad">sad</padig:language>
      <padig:language string="sag" uri="http://lexvo.org/id/iso639-3/sag">sag</padig:language>
      <padig:language string="sah" uri="http://lexvo.org/id/iso639-3/sah">sah</padig:language>
      <padig:language string="sai" uri="http://lexvo.org/id/iso639-5/sai">sai</padig:language>
      <padig:language string="sal" uri="http://lexvo.org/id/iso639-5/sal">sal</padig:language>
      <padig:language string="sam" uri="http://lexvo.org/id/iso639-3/sam">sam</padig:language>
      <padig:language string="san" uri="http://lexvo.org/id/iso639-3/san">san</padig:language>
      <padig:language string="sas" uri="http://lexvo.org/id/iso639-3/sas">sas</padig:language>
      <padig:language string="sat" uri="http://lexvo.org/id/iso639-3/sat">sat</padig:language>
      <padig:language string="scn" uri="http://lexvo.org/id/iso639-3/scn">scn</padig:language>
      <padig:language string="sco" uri="http://lexvo.org/id/iso639-3/sco">sco</padig:language>
      <padig:language string="sel" uri="http://lexvo.org/id/iso639-3/sel">sel</padig:language>
      <padig:language string="sem" uri="http://lexvo.org/id/iso639-5/sem">sem</padig:language>
      <padig:language string="sga" uri="http://lexvo.org/id/iso639-3/sga">sga</padig:language>
      <padig:language string="sgn" uri="http://lexvo.org/id/iso639-5/sgn">sgn</padig:language>
      <padig:language string="shn" uri="http://lexvo.org/id/iso639-3/shn">shn</padig:language>
      <padig:language string="sid" uri="http://lexvo.org/id/iso639-3/sid">sid</padig:language>
      <padig:language string="sin" uri="http://lexvo.org/id/iso639-3/sin">sin</padig:language>
      <padig:language string="sio" uri="http://lexvo.org/id/iso639-5/sio">sio</padig:language>
      <padig:language string="sit" uri="http://lexvo.org/id/iso639-5/sit">sit</padig:language>
      <padig:language string="sla" uri="http://lexvo.org/id/iso639-5/sla">sla</padig:language>
      <padig:language string="slk" uri="http://lexvo.org/id/iso639-3/slk">slk</padig:language>
      <padig:language string="slo" uri="http://lexvo.org/id/iso639-3/slk">slo</padig:language>
      <padig:language string="slv" uri="http://lexvo.org/id/iso639-3/slv">slv</padig:language>
      <padig:language string="sma" uri="http://lexvo.org/id/iso639-3/sma">sma</padig:language>
      <padig:language string="sme" uri="http://lexvo.org/id/iso639-3/sme">sme</padig:language>
      <padig:language string="smi" uri="http://lexvo.org/id/iso639-5/smi">smi</padig:language>
      <padig:language string="smj" uri="http://lexvo.org/id/iso639-3/smj">smj</padig:language>
      <padig:language string="smn" uri="http://lexvo.org/id/iso639-3/smn">smn</padig:language>
      <padig:language string="smo" uri="http://lexvo.org/id/iso639-3/smo">smo</padig:language>
      <padig:language string="sms" uri="http://lexvo.org/id/iso639-3/sms">sms</padig:language>
      <padig:language string="sna" uri="http://lexvo.org/id/iso639-3/sna">sna</padig:language>
      <padig:language string="snd" uri="http://lexvo.org/id/iso639-3/snd">snd</padig:language>
      <padig:language string="snk" uri="http://lexvo.org/id/iso639-3/snk">snk</padig:language>
      <padig:language string="sog" uri="http://lexvo.org/id/iso639-3/sog">sog</padig:language>
      <padig:language string="som" uri="http://lexvo.org/id/iso639-3/som">som</padig:language>
      <padig:language string="son" uri="http://lexvo.org/id/iso639-5/son">son</padig:language>
      <padig:language string="sot" uri="http://lexvo.org/id/iso639-3/sot">sot</padig:language>
      <padig:language string="spa" uri="http://lexvo.org/id/iso639-3/spa">spa</padig:language>
      <padig:language string="sqi" uri="http://lexvo.org/id/iso639-3/sqi">sqi</padig:language>
      <padig:language string="srd" uri="http://lexvo.org/id/iso639-3/srd">srd</padig:language>
      <padig:language string="srn" uri="http://lexvo.org/id/iso639-3/srn">srn</padig:language>
      <padig:language string="srp" uri="http://lexvo.org/id/iso639-3/srp">srp</padig:language>
      <padig:language string="srr" uri="http://lexvo.org/id/iso639-3/srr">srr</padig:language>
      <padig:language string="ssa" uri="http://lexvo.org/id/iso639-5/ssa">ssa</padig:language>
      <padig:language string="ssw" uri="http://lexvo.org/id/iso639-3/ssw">ssw</padig:language>
      <padig:language string="suk" uri="http://lexvo.org/id/iso639-3/suk">suk</padig:language>
      <padig:language string="sun" uri="http://lexvo.org/id/iso639-3/sun">sun</padig:language>
      <padig:language string="sus" uri="http://lexvo.org/id/iso639-3/sus">sus</padig:language>
      <padig:language string="sux" uri="http://lexvo.org/id/iso639-3/sux">sux</padig:language>
      <padig:language string="swa" uri="http://lexvo.org/id/iso639-3/swa">swa</padig:language>
      <padig:language string="swe" uri="http://lexvo.org/id/iso639-3/swe">swe</padig:language>
      <padig:language string="syc" uri="http://lexvo.org/id/iso639-3/syc">syc</padig:language>
      <padig:language string="syr" uri="http://lexvo.org/id/iso639-3/syr">syr</padig:language>
      <padig:language string="tah" uri="http://lexvo.org/id/iso639-3/tah">tah</padig:language>
      <padig:language string="tai" uri="http://lexvo.org/id/iso639-5/tai">tai</padig:language>
      <padig:language string="tam" uri="http://lexvo.org/id/iso639-3/tam">tam</padig:language>
      <padig:language string="tat" uri="http://lexvo.org/id/iso639-3/tat">tat</padig:language>
      <padig:language string="tel" uri="http://lexvo.org/id/iso639-3/tel">tel</padig:language>
      <padig:language string="tem" uri="http://lexvo.org/id/iso639-3/tem">tem</padig:language>
      <padig:language string="ter" uri="http://lexvo.org/id/iso639-3/ter">ter</padig:language>
      <padig:language string="tet" uri="http://lexvo.org/id/iso639-3/tet">tet</padig:language>
      <padig:language string="tgk" uri="http://lexvo.org/id/iso639-3/tgk">tgk</padig:language>
      <padig:language string="tgl" uri="http://lexvo.org/id/iso639-3/tgl">tgl</padig:language>
      <padig:language string="tha" uri="http://lexvo.org/id/iso639-3/tha">tha</padig:language>
      <padig:language string="tib" uri="http://lexvo.org/id/iso639-3/bod">tib</padig:language>
      <padig:language string="tig" uri="http://lexvo.org/id/iso639-3/tig">tig</padig:language>
      <padig:language string="tir" uri="http://lexvo.org/id/iso639-3/tir">tir</padig:language>
      <padig:language string="tiv" uri="http://lexvo.org/id/iso639-3/tiv">tiv</padig:language>
      <padig:language string="tkl" uri="http://lexvo.org/id/iso639-3/tkl">tkl</padig:language>
      <padig:language string="tlh" uri="http://lexvo.org/id/iso639-3/tlh">tlh</padig:language>
      <padig:language string="tli" uri="http://lexvo.org/id/iso639-3/tli">tli</padig:language>
      <padig:language string="tmh" uri="http://lexvo.org/id/iso639-3/tmh">tmh</padig:language>
      <padig:language string="tog" uri="http://lexvo.org/id/iso639-3/tog">tog</padig:language>
      <padig:language string="ton" uri="http://lexvo.org/id/iso639-3/ton">ton</padig:language>
      <padig:language string="tpi" uri="http://lexvo.org/id/iso639-3/tpi">tpi</padig:language>
      <padig:language string="tsi" uri="http://lexvo.org/id/iso639-3/tsi">tsi</padig:language>
      <padig:language string="tsn" uri="http://lexvo.org/id/iso639-3/tsn">tsn</padig:language>
      <padig:language string="tso" uri="http://lexvo.org/id/iso639-3/tso">tso</padig:language>
      <padig:language string="tuk" uri="http://lexvo.org/id/iso639-3/tuk">tuk</padig:language>
      <padig:language string="tum" uri="http://lexvo.org/id/iso639-3/tum">tum</padig:language>
      <padig:language string="tup" uri="http://lexvo.org/id/iso639-5/tup">tup</padig:language>
      <padig:language string="tur" uri="http://lexvo.org/id/iso639-3/tur">tur</padig:language>
      <padig:language string="tut" uri="http://lexvo.org/id/iso639-5/tut">tut</padig:language>
      <padig:language string="tvl" uri="http://lexvo.org/id/iso639-3/tvl">tvl</padig:language>
      <padig:language string="twi" uri="http://lexvo.org/id/iso639-3/twi">twi</padig:language>
      <padig:language string="tyv" uri="http://lexvo.org/id/iso639-3/tyv">tyv</padig:language>
      <padig:language string="udm" uri="http://lexvo.org/id/iso639-3/udm">udm</padig:language>
      <padig:language string="uga" uri="http://lexvo.org/id/iso639-3/uga">uga</padig:language>
      <padig:language string="uig" uri="http://lexvo.org/id/iso639-3/uig">uig</padig:language>
      <padig:language string="ukr" uri="http://lexvo.org/id/iso639-3/ukr">ukr</padig:language>
      <padig:language string="umb" uri="http://lexvo.org/id/iso639-3/umb">umb</padig:language>
      <padig:language string="und" uri="http://lexvo.org/id/iso639-3/und">und</padig:language>
      <padig:language string="urd" uri="http://lexvo.org/id/iso639-3/urd">urd</padig:language>
      <padig:language string="uzb" uri="http://lexvo.org/id/iso639-3/uzb">uzb</padig:language>
      <padig:language string="vai" uri="http://lexvo.org/id/iso639-3/vai">vai</padig:language>
      <padig:language string="ven" uri="http://lexvo.org/id/iso639-3/ven">ven</padig:language>
      <padig:language string="vie" uri="http://lexvo.org/id/iso639-3/vie">vie</padig:language>
      <padig:language string="vol" uri="http://lexvo.org/id/iso639-3/vol">vol</padig:language>
      <padig:language string="vot" uri="http://lexvo.org/id/iso639-3/vot">vot</padig:language>
      <padig:language string="wak" uri="http://lexvo.org/id/iso639-5/wak">wak</padig:language>
      <padig:language string="wal" uri="http://lexvo.org/id/iso639-3/wal">wal</padig:language>
      <padig:language string="war" uri="http://lexvo.org/id/iso639-3/war">war</padig:language>
      <padig:language string="was" uri="http://lexvo.org/id/iso639-3/was">was</padig:language>
      <padig:language string="wel" uri="http://lexvo.org/id/iso639-3/cym">wel</padig:language>
      <padig:language string="wen" uri="http://lexvo.org/id/iso639-5/wen">wen</padig:language>
      <padig:language string="wln" uri="http://lexvo.org/id/iso639-3/wln">wln</padig:language>
      <padig:language string="wol" uri="http://lexvo.org/id/iso639-3/wol">wol</padig:language>
      <padig:language string="xal" uri="http://lexvo.org/id/iso639-3/xal">xal</padig:language>
      <padig:language string="xho" uri="http://lexvo.org/id/iso639-3/xho">xho</padig:language>
      <padig:language string="yao" uri="http://lexvo.org/id/iso639-3/yao">yao</padig:language>
      <padig:language string="yap" uri="http://lexvo.org/id/iso639-3/yap">yap</padig:language>
      <padig:language string="yid" uri="http://lexvo.org/id/iso639-3/yid">yid</padig:language>
      <padig:language string="yor" uri="http://lexvo.org/id/iso639-3/yor">yor</padig:language>
      <padig:language string="ypk" uri="http://lexvo.org/id/iso639-5/ypk">ypk</padig:language>
      <padig:language string="zap" uri="http://lexvo.org/id/iso639-3/zap">zap</padig:language>
      <padig:language string="zbl" uri="http://lexvo.org/id/iso639-3/zbl">zbl</padig:language>
      <padig:language string="zen" uri="http://lexvo.org/id/iso639-3/zen">zen</padig:language>
      <padig:language string="zha" uri="http://lexvo.org/id/iso639-3/zha">zha</padig:language>
      <padig:language string="zho" uri="http://lexvo.org/id/iso639-3/zho">zho</padig:language>
      <padig:language string="znd" uri="http://lexvo.org/id/iso639-5/znd">znd</padig:language>
      <padig:language string="zul" uri="http://lexvo.org/id/iso639-3/zul">zul</padig:language>
      <padig:language string="zun" uri="http://lexvo.org/id/iso639-3/zun">zun</padig:language>
      <padig:language string="zza" uri="http://lexvo.org/id/iso639-3/zza">zza</padig:language>
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
