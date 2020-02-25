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
		<padig:url string="Villanova University">https://digital.library.villanova.edu/</padig:url>
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
	        <padig:set string="Bloomsburg University Map Collection">blmmap</padig:set>
	        <padig:set string="Bloomsburg University Photographs Collection">blmphoto</padig:set>
	        <padig:set string="Bloomsburg University Postcard Collection">blmpost</padig:set>
	    	<padig:set string="Millersville University Photograph Collection">mvsphoto</padig:set>
	        <padig:set string="Millersville University Postcard Collection">wingpost</padig:set>
	        <padig:set string="Slippery Rock University Audio Collection">audio</padig:set>
	        <padig:set string="Slippery Rock University Photograph Collection">photograph</padig:set>
	        <padig:set string="Slippery Rock University Postcard Collection">postcard</padig:set>
	        <padig:set string="Slippery Rock University Yearbooks - The Saxigena (selected years)">yearbooks</padig:set>
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
