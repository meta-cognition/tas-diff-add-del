<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="https://www.w3.org/1999/xhtml" xml:lang="en-us" lang="en-us"><!-- InstanceBegin template="/Templates/subpage_sidebar-cfm.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE11" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- InstanceBeginEditable name="websitetitle" -->
<title>Bid Calendar, Construction Bidding, Alaska DOT&amp;PF</title>
<!-- InstanceEndEditable -->

<!-- InstanceBeginEditable name="keywords" -->
<meta name="keywords" content="State Alaska Department Transportation Public Facilities DOT DOTPF DOT&quot;PF " />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE11" /> 
<!-- InstanceEndEditable -->

<meta name="author" content="&copy;Alaska Department of Transportation and Public Facilities, all rights reserved.">
<link rel="shortcut icon" href="/favicon.ico"> 
<link rel="icon" type="image/ico" href="/favicon.ico">
<link href="/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="/css/dot-2018.css" rel="stylesheet" type="text/css">

<!-- InstanceBeginEditable name="optional_css_area" -->




<!-- InstanceEndEditable -->
<!-- STATISTICS AREA -->
	<cfinclude template="/css/header-stats.html">
<!-- END STATISTICS AREA -->
</head>

<body>
<a href="#main_content" class="visuallyhidden">Skip to content</a> 
<!--[if lte IE 9]>
	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->
        
<!-- GLOBAL HEADER -->

<!-- STATE HEADER -->
	<cfinclude template="/css/header-SOA.html">
<!-- DEPARTMENT HEADER -->
<div class="container p-0 pt-lg-2" style="max-width: 960px;"> 
  <header>
    <div class="row mt-lg-4 mx-0 pt-4 pb-2 px-0" style="background-color: #072F49;"> 
      <!-- DOT Agency Logo and Title -->
      <div class="col-md-9 pl-3 text-center text-md-left mr-0 pr-0">
        <div class="mx-0 float-md-left pr-2 pt-0" style="margin-top: -.5em;"><a href="/"><img src="/images/dot-seal-69.png" alt="Department of Transportation &amp; Public Facilities Logo" title="Link to DOT&amp;PF homepage" height="69" width="69"></a></div>
        <div>
<!-- InstanceBeginEditable name="main header" -->
    	<a href="/procurement/" class="text-white">
	Alaska Department of Transportation and Public Facilities<br>
	<h3>PROCUREMENT AND CONTRACTING</h3>
	</a>
	<!-- InstanceEndEditable -->
		</div>
      </div>
      
<!-- DOT and SOA SEARCH -->
	<cfinclude template="/css/header-search.html">
    </div>
  </header>
<!-- END GLOBAL HEADER -->

<!-- DOT NAVIGATION (blue bar) -->
	<cfinclude template="/css/dept-nav.html">
<!-- END DOT NAVIGATION -->
	
<!-- BREADCRUMBS -->
<div class="breadcrumb pl-4 py-1 m-0 rounded-0"><small>
	You are here:&nbsp;<a href="/">DOT&amp;PF</a>&nbsp;&gt;&nbsp;
<!-- InstanceBeginEditable name="Breadcrumbs" --><a href="/procurement/"> Procurement and Contracting </a>
        &gt; Construction Bidding &gt; Bid Calendar<!-- InstanceEndEditable -->
	</small>
</div>
<!-- END BREADCRUMBS -->

<!-- CONTENT AREA -->
<section>
	<div class="row mx-0" style="background-color: #FFF;">
			<div class="col-md-9 pt-4"><a name="main_content"></a>

<!-- MAIN CONTENT AREA -->
<!-- InstanceBeginEditable name="main content" -->    
      
<!--- Regional Sort determination --->
<cfset theRegion = ''>
<cfif structKeyExists(url, 'rc') and trim(url.rc) neq "">
	<cfswitch expression="#UCase(rc)#">
		<cfcase value='NR'>
			<cfset theRegion = 'Northern Region'>
		</cfcase>
		<cfcase value='SR'>
			<cfset theRegion = 'Southcoast Region'>
		</cfcase>
		<cfcase value='CR'>
			<cfset theRegion = 'Central Region'>
		</cfcase>
		<cfcase value='M'>
			<cfset theRegion = 'Marine Highways'>
		</cfcase>
		<cfcase value='SW'>
			<cfset theRegion = 'Statewide'>
		</cfcase>
	</cfswitch>
</cfif>

    <h2><cfoutput>#theRegion#</cfoutput> Bid Calendar </h2>

    <cfoutput>
    <p>As of #DateFormat(Now(), "mm/dd/yyyy")# #TimeFormat(Now())# 
		<cfif GetTimeZoneInfo().isDSTon eq "YES">
		AKDT
		<cfelse>
		AKST
		</cfif>
    </p>
    </cfoutput>
<small>
	<p align="center">Unless otherwise noted, bids are due before 2:00 PM local time on the date and at the location listed in the Invitation to Bid. 
    On that date, the Department will publicly announce timely-received bids at the time listed in the Invitation to Bid.</p>
	<p align="center">TO OBTAIN BID DOCUMENTS LISTED BELOW, PLEASE CONTACT THE APPROPRIATE DOT&amp;PF PLANS ROOMS. THERE MAY BE A NON REFUNDABLE CHARGE.</p>
	<p align="center">CENTRAL REGION: Contracts Section, Aviation Building, 4111 Aviation Ave., Anchorage, AK<br />
		(907) 269-0400 <a href="mailto:sharon.smith@alaska.gov">sharon.smith@alaska.gov</a></p>
	<p align="center">NORTHERN REGION: Engineering Services Building, 2301 Peger Rd., Fairbanks, AK<br />
		(907) 451-2247 <a href="mailto:barbara.tanner@alaska.gov">barbara.tanner@alaska.gov</a></p>
	<p align="center">SOUTHCOAST REGION: Contracts Section, 6860 Glacier Highway, Juneau, AK<br />
		(907) 465-4420 <a href="mailto:eric.verrelli@alaska.gov">eric.verrelli@alaska.gov</a></p>
</small>
<p><strong>DBE UTILIZATION:</strong> All projects financed all or in part with federal funds are required to provide Disadvantaged Business Enterprises (DBE) 
	opportunity to participate fairly with other contractors in the performance of contracts.  See applicable DBE specifications (Section 120 or Item G-120) 
    for project specific race-conscious or program wide race-neutral DBE Utilization Goals.  Projects with a race-conscious DBE Utilization Goal will include 
    the goal amount in the Invitation to Bid.</p>

<p>Only the information published in the bid documents issued in electronic or paper format by the Contracting Agency should be used as a basis for bid preparation.</p>

<cfquery name="qryAWP" datasource="#application.db#">
select
	proposal_id
	,propname
	,propnum
	,statenum
	,fednum
	,region
	,bidopendt
	,advdate
	,description
	,ojt
	,engest
	,bidx
from
	trnsport.DOTPF_WEB_BID_VW
<cfif LEN(theRegion) gt 1>where
	region = '#theRegion#'</cfif>
order by
	bidopendt
	,region
	,propname
</cfquery>
<cfloop query="qryAWP">
  <cfoutput>
    <p class="box" style="border-radius: 10px 0px 0px 0px; border-width:1px; padding:5px">
    <strong> <a href="#BIDX#" class="linkcopybody" target="_blank">#PROPNAME#</a></strong> &nbsp; <a href="awp-plans.cfm?pn=#proposal_id#" class="btn btn-sm btn-primary rounded float-right">Plan Holders List</a> <br />
    <strong>Contract##:</strong> #PROPNUM#<br />
    <strong>Federal## / IRIS Program##:</strong> #FEDNUM# / #STATENUM#<br />
    <strong>Region:</strong> #REGION#<br />
    <strong>Bid Opening Date:</strong>  #DateFormat(BIDOPENDT, 'mm/dd/YYYY')#<br />
    <strong>Advertise Date: </strong> #DateFormat(ADVDATE, 'mm/dd/YYYY')#<br />
    <strong>Description:</strong>  #DESCRIPTION#<br />
    <strong>On the Job Trainees/Apprentices (item 645):</strong> #OJT#<br />
    <strong>Engineer's Estimate Range:</strong> #ENGEST#
    </p>
  </cfoutput>
</cfloop>

<cfif qryAWP.RecordCount lt 1>
<p class="box" align="center"> No records were found for <cfoutput>#theRegion#</cfoutput></p>
</cfif>
             
            
	<!-- InstanceEndEditable -->
	</div>
<!-- END MAIN CONTENT -->
	
<!-- SIDEBAR AREA -->
	<div class="col-md-3 pl-md-3 pt-4" id="sidebar">
<!-- InstanceBeginEditable name="main sidebar" -->
      
<cfinclude template="awp-menu.shtml">

                
	<!-- InstanceEndEditable -->
	</div>
<!-- END SIDEBAR -->

</div>
</section>
<!-- END CONTENT AREA -->
</div>
<!-- FOOTER AREA -->
<cfinclude template="/css/footer.html">
<!-- END FOOTER AREA -->
<!-- JAVASCRIPT AREA -->
<cfinclude template="/css/footer-scripts.html">
<!-- InstanceBeginEditable name="javascript" -->

<!-- InstanceEndEditable -->
<!-- END JAVASCRIPT AREA -->
</body>
<!-- InstanceEnd --></html>
