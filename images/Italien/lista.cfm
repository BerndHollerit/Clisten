
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Rai Radio1</title>

<link href="http://www.radio.rai.it/radio1/radio1_menu.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="http://www.radio.rai.it/radio1/mm_menu.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="stile_radio1.css" rel="stylesheet" type="text/css">

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<!-- a -->
</head>
 

<body bgcolor="FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<style type="text/css">
#TESTO-ORAINONDA{
font-family:Verdana, Arial, Helvetica, sans-serif;
font-size:10px;
line-height:13px;
margin-top:16px;
margin-left:3px;
width:146px;
height:27px;
overflow:auto;
}
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_nbGroup(event, grpName) { //v6.0
  var i,img,nbArr,args=MM_nbGroup.arguments;
  if (event == "init" && args.length > 2) {
    if ((img = MM_findObj(args[2])) != null && !img.MM_init) {
      img.MM_init = true; img.MM_up = args[3]; img.MM_dn = img.src;
      if ((nbArr = document[grpName]) == null) nbArr = document[grpName] = new Array();
      nbArr[nbArr.length] = img;
      for (i=4; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
        if (!img.MM_up) img.MM_up = img.src;
        img.src = img.MM_dn = args[i+1];
        nbArr[nbArr.length] = img;
    } }
  } else if (event == "over") {
    document.MM_nbOver = nbArr = new Array();
    for (i=1; i < args.length-1; i+=3) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = (img.MM_dn && args[i+2]) ? args[i+2] : ((args[i+1])? args[i+1] : img.MM_up);
      nbArr[nbArr.length] = img;
    }
  } else if (event == "out" ) {
    for (i=0; i < document.MM_nbOver.length; i++) {
      img = document.MM_nbOver[i]; img.src = (img.MM_dn) ? img.MM_dn : img.MM_up; }
  } else if (event == "down") {
    nbArr = document[grpName];
    if (nbArr)
      for (i=0; i < nbArr.length; i++) { img=nbArr[i]; img.src = img.MM_up; img.MM_dn = 0; }
    document[grpName] = nbArr = new Array();
    for (i=2; i < args.length-1; i+=2) if ((img = MM_findObj(args[i])) != null) {
      if (!img.MM_up) img.MM_up = img.src;
      img.src = img.MM_dn = (args[i+1])? args[i+1] : img.MM_up;
      nbArr[nbArr.length] = img;
  } }
}
//-->
</script>
<script language="JavaScript">
<!--
function mmLoadMenus() {
  if (window.mm_menu_0506141907_0) return;
  window.mm_menu_0506141907_0 = new Menu("root",150,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506141907_0.addMenuItem("Baobab","window.open('/radio1/baobab/', '_top');");
  mm_menu_0506141907_0.addMenuItem("Corriere Diplomatico","window.open('/radio1/corrierediplomatico/', '_top');");
  mm_menu_0506141907_0.addMenuItem("La notte di Radio1","window.open('/radio1/lanottediradio1/', '_top');");
  mm_menu_0506141907_0.addMenuItem("In europa","window.open('/radio1/ineuropa/', '_top');");
  mm_menu_0506141907_0.addMenuItem("Inviato speciale","window.open('/radio1/inviatospeciale/index.cfm', '_top');");
  mm_menu_0506141907_0.addMenuItem("Italia: istruzioni per l'uso","window.open('/radio1/italiaistruzioniperluso/index.cfm', '_top');");
    mm_menu_0506141907_0.addMenuItem("GR Parlamento","window.open('/grparlamento/', '_top');");
	  mm_menu_0506141907_0.addMenuItem("News generation","window.open('/radio1/newsgeneration/', '_top');");
	    mm_menu_0506141907_0.addMenuItem("Pianeta dimenticato","window.open('/radio1/pianetadimenticato/', '_top');");
		  mm_menu_0506141907_0.addMenuItem("Radio anch'io","window.open('/radio1/radioanchio/', '_top');");
		   mm_menu_0506141907_0.addMenuItem("Voci dal mondo","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=443&Tematica=7&Testo=Voci', '_top');");
		    mm_menu_0506141907_0.addMenuItem("Zapping","window.open('/radio1/zapping/', '_top');");
   mm_menu_0506141907_0.hideOnMouseOut=true;
   mm_menu_0506141907_0.menuBorder=1;
   mm_menu_0506141907_0.menuLiteBgColor='#cce3f8';
   mm_menu_0506141907_0.menuBorderBgColor='#356595';
   mm_menu_0506141907_0.bgColor='#cce3f8';
  window.mm_menu_0506142331_1 = new Menu("root",120,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142331_1.addMenuItem("Bit","window.open('/radio1/bit/', '_top');");
  mm_menu_0506142331_1.addMenuItem("Break","window.open('/radio1/break/', '_top');");
    mm_menu_0506142331_1.addMenuItem("Fantasticamente","window.open('/radio1/fantasticamente/', '_top');");
	  mm_menu_0506142331_1.addMenuItem("La Medicina","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=117&Tematica=9&Testo=Medicina', '_top');");
	    mm_menu_0506142331_1.addMenuItem("Le Scienze","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=457&Tematica=14&Testo=Scienze', '_top');");
		mm_menu_0506142331_1.addMenuItem("Pronto salute","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=442&Tematica=9&Testo=Pronto', '_top');");
   mm_menu_0506142331_1.hideOnMouseOut=true;
   mm_menu_0506142331_1.menuBorder=1;
   mm_menu_0506142331_1.menuLiteBgColor='#cce3f8';
   mm_menu_0506142331_1.menuBorderBgColor='#356595';
   mm_menu_0506142331_1.bgColor='#cce3f8';
  window.mm_menu_0506142437_2 = new Menu("root",120,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142437_2.addMenuItem("Questione di Borsa","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=421&Tematica=6&Testo=QB', '_top');");
  mm_menu_0506142437_2.addMenuItem("Questione di Soldi","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=91&Tematica=6&Testo=Qs', '_top');");
    mm_menu_0506142437_2.addMenuItem("Capitan Cook","window.open('/radio1/capitancook/', '_top');");
   mm_menu_0506142437_2.hideOnMouseOut=true;
   mm_menu_0506142437_2.menuBorder=1;
   mm_menu_0506142437_2.menuLiteBgColor='#cce3f8';
   mm_menu_0506142437_2.menuBorderBgColor='#356595';
   mm_menu_0506142437_2.bgColor='#cce3f8';
  window.mm_menu_0506142511_3 = new Menu("root",140,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142511_3.addMenuItem("Argonauta","window.open('/radio1/argonauta/', '_top');");
  mm_menu_0506142511_3.addMenuItem("Con parole mie","window.open('/radio1/conparolemie/', '_top');");
    mm_menu_0506142511_3.addMenuItem("Facciamo storie","window.open('/radio1/facciamostorie/index.cfm', '_blank');");
	  mm_menu_0506142511_3.addMenuItem("Il baco del millennio","window.open('/radio1/ilbacodelmillennio/', '_top');");
	    mm_menu_0506142511_3.addMenuItem("Ottantaradio","window.open('/radio1/ottantaradio/', '_top');");
		mm_menu_0506142511_3.addMenuItem("Radio Campus","window.open('/radio1/radiocampus/index.cfm', '_top');");
		mm_menu_0506142511_3.addMenuItem("Tramate con noi","window.open('/radio1/tramate_noi', '_blank');");
   mm_menu_0506142511_3.hideOnMouseOut=true;
   mm_menu_0506142511_3.menuBorder=1;
   mm_menu_0506142511_3.menuLiteBgColor='#cce3f8';
   mm_menu_0506142511_3.menuBorderBgColor='#356595';
   mm_menu_0506142511_3.bgColor='#cce3f8';
  window.mm_menu_0506142600_4 = new Menu("root",140,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142600_4.addMenuItem("Diversi da chi","window.open('/radio1/diversidachi/', '_top');");
  mm_menu_0506142600_4.addMenuItem("Permesso di soggiorno","window.open('/radio1/permessodisoggiorno', '_top');");
    mm_menu_0506142600_4.addMenuItem("La radio ne parla","window.open('/radio1/laradioneparla/', '_top');");
	  mm_menu_0506142600_4.addMenuItem("Tam Tam lavoro","window.open('/radio1/tamtamlavoro/', '_top');");
   mm_menu_0506142600_4.hideOnMouseOut=true;
   mm_menu_0506142600_4.menuBorder=1;
   mm_menu_0506142600_4.menuLiteBgColor='#cce3f8';
   mm_menu_0506142600_4.menuBorderBgColor='#356595';
   mm_menu_0506142600_4.bgColor='#cce3f8';
  window.mm_menu_0506142625_5 = new Menu("root",120,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142625_5.addMenuItem("Domenica sport","window.open('/radio1/domenicasport/', '_top');");
  mm_menu_0506142625_5.addMenuItem("Radio anch'io sport","window.open('/radio1/radioanchiosport/', '_top');");
  mm_menu_0506142625_5.addMenuItem("Sportlandia","window.open('/radio1/sportlandia/', '_top');");
  mm_menu_0506142625_5.addMenuItem("Tutto il calcio","window.open('/radio1/tuttoilcalcio/', '_top');");
   mm_menu_0506142625_5.hideOnMouseOut=true;
   mm_menu_0506142625_5.menuBorder=1;
   mm_menu_0506142625_5.menuLiteBgColor='#cce3f8';
   mm_menu_0506142625_5.menuBorderBgColor='#356595';
   mm_menu_0506142625_5.bgColor='#cce3f8';
  window.mm_menu_0506142646_6 = new Menu("root",120,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142646_6.addMenuItem("Demo","window.open('/radio1/demo/', '_top');");
  mm_menu_0506142646_6.addMenuItem("Radioscrigno","window.open('/radioscrigno/', '_blank');");
     mm_menu_0506142646_6.addMenuItem("Radio1 Musica","window.open('/radio1/radiounomusica/index.cfm', '_top');");
  mm_menu_0506142646_6.addMenuItem("Stereonotte","window.open('/radio1/radiounomusica/stereonotte.cfm', '_top');");
  mm_menu_0506142646_6.addMenuItem("Venerdì notte","window.open('/radio1/radiounomusica/venerdinotte.cfm', '_top');");
  mm_menu_0506142646_6.addMenuItem("Village","window.open('/radio1/radiounomusica/appuntamenti.cfm', '_top');");
   mm_menu_0506142646_6.hideOnMouseOut=true;
   mm_menu_0506142646_6.menuBorder=1;
   mm_menu_0506142646_6.menuLiteBgColor='#cce3f8';
   mm_menu_0506142646_6.menuBorderBgColor='#356595';
   mm_menu_0506142646_6.bgColor='#cce3f8';
  window.mm_menu_0506142730_7 = new Menu("root",120,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142730_7.addMenuItem("Oggi 2000","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=83&Tematica=8&Testo=Oggi', '_top');");
  mm_menu_0506142730_7.addMenuItem("Oggi 2000 la Bibbia","window.open('/radio1/oggi2000labibbia', '_top');");
    mm_menu_0506142730_7.addMenuItem("Culto Evangelico","window.open('/radio1/cultoevangelico', '_top');");
   mm_menu_0506142730_7.hideOnMouseOut=true;
   mm_menu_0506142730_7.menuBorder=1;
   mm_menu_0506142730_7.menuLiteBgColor='#cce3f8';
   mm_menu_0506142730_7.menuBorderBgColor='#356595';
   mm_menu_0506142730_7.bgColor='#cce3f8';
  window.mm_menu_0506142750_8 = new Menu("root",120,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142750_8.addMenuItem("Ho perso il trend","window.open('/radio1/hopersoiltrend/', '_top');");
  mm_menu_0506142750_8.addMenuItem("Italia che va","window.open('/radio1/italiacheva/', '_top');");
   mm_menu_0506142750_8.addMenuItem("Magazine","window.open('/radio1/magazine/', '_top');");
    mm_menu_0506142750_8.addMenuItem("Il comunicattivo","window.open('/radio1/ilcomunicattivo/', '_top');");
	 mm_menu_0506142750_8.addMenuItem("Mondo motori","window.open('/radio1/mondomotori/index.cfm', '_top');");
	  mm_menu_0506142750_8.addMenuItem("Radiogames","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=452&Tematica=25', '_top');");
	   mm_menu_0506142750_8.addMenuItem("A tavola","window.open('/radio1/atavola/', '_top');");
	   mm_menu_0506142750_8.addMenuItem("Tender","window.open('/radio1/tender/', '_top');");
   mm_menu_0506142750_8.hideOnMouseOut=true;
   mm_menu_0506142750_8.menuBorder=1;
   mm_menu_0506142750_8.menuLiteBgColor='#cce3f8';
   mm_menu_0506142750_8.menuBorderBgColor='#356595';
   mm_menu_0506142750_8.bgColor='#cce3f8';
  window.mm_menu_0506142812_9 = new Menu("root",123,17,"Verdana, Arial, Helvetica, sans-serif",11,"#003366","#003366","#cce3f8","#ffffff","left","middle",2,0,500,1,0,true,true,true,0,false,false);
  mm_menu_0506142812_9.addMenuItem("Speciale Agricoltura","window.open('/radio1/rubriche/index.cfm?Q_PROG_ID=422&Tematica=24', '_top');");
  mm_menu_0506142812_9.addMenuItem("Habitat","window.open('/radio1/habitat/', '_top');");
   mm_menu_0506142812_9.hideOnMouseOut=true;
   mm_menu_0506142812_9.menuBorder=1;
   mm_menu_0506142812_9.menuLiteBgColor='#cce3f8';
   mm_menu_0506142812_9.menuBorderBgColor='#356595';
   mm_menu_0506142812_9.bgColor='#cce3f8';

  mm_menu_0506142812_9.writeMenus();
} // mmLoadMenus()
//-->
</script>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<script language="JavaScript1.2" src="/radio1/images/mm_menu.js"></script>


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td background="/images/bg_celestino.gif"><table width="771" border="0" align="center" cellpadding="0" cellspacing="0">
<FORM NAME="ricerca" ACTION="http://ricerca.rai.it/RaiSearch.asp">  
	<SCRIPT LANGUAGE="JavaScript" SRC="/CmsRai/barre/jsricerca/1,,11,00.js"></SCRIPT> 
	<NOSCRIPT> 
	<INPUT TYPE=HIDDEN NAME="method" VALUE="mainQuery" /> 
	<INPUT TYPE="HIDDEN" NAME="QuerySummaryCB" VALUE="querysummary" /> 
	<INPUT TYPE="HIDDEN" NAME="numresults" VALUE="300" /> 
	<INPUT TYPE="HIDDEN" name="batchhits" VALUE="10" /> 
	<INPUT TYPE="hidden" name="xoptions" VALUE="sortboth" /> 
	<INPUT TYPE="HIDDEN" NAME="querythreshold" VALUE="40" /> 
	<INPUT TYPE="hidden" name="attachto" VALUE="db" /> 
	<INPUT TYPE="HIDDEN" NAME="daterange" VALUE="lastdays" /> 
	<INPUT TYPE="hidden" name="selectlastdays" value="10000" /> 
	</NOSCRIPT>
          <!-- fwtable fwsrc="TOP_ALTO2.png" fwbase="top2.gif" fwstyle="Dreamweaver" fwdocid = "742308039" fwnested="0" -->
          <tr> 
            <td><img src="/images/spacer.gif" width="10" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="13" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="22" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="35" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="25" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="29" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="22" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="60" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="19" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="40" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="21" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="30" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="22" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="58" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="17" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="86" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="29" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="99" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="13" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="37" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="27" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="48" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="9" height="1" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
          </tr>
          <tr> 
            <td colspan="23"><img name="top2_r1_c1" src="/images/top2_r1_c1.gif" width="771" height="4" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="1" height="4" border="0" alt=""></td>
          </tr>
          <tr> 
            <td colspan="17"><img name="top2_r2_c1" src="/images/top2_r2_c1.gif" width="538" height="4" border="0" alt=""></td>
            <td rowspan="3"  valign="top"> <INPUT TYPE=HIDDEN NAME="method" VALUE="mainQuery"> 
              <INPUT TYPE=HIDDEN NAME="method2" VALUE="mainQuery"> <INPUT TYPE="HIDDEN" NAME="QuerySummaryCB" VALUE="querysummary"> 
              <INPUT TYPE="HIDDEN" NAME="numresults" VALUE="300"> <input type="HIDDEN" name="batchhits" value=10> 
              <input type="hidden" name="xoptions" value="sortboth"> <INPUT TYPE="HIDDEN" NAME="querythreshold" VALUE="40"> 
              <input type="hidden" name="attachto" value="db"> <INPUT TYPE="HIDDEN" NAME="canale" VALUE="tutti"> 
              <INPUT TYPE="HIDDEN" NAME="daterange" VALUE="lastdays"> <input type="hidden" name="selectlastdays" value="10000"> 
              <INPUT TYPE="HIDDEN" NAME="testo" VALUE=""> <input name="query" type="text" title="Inserisci il testo da ricercare" value="" style="font-weight: normal;color: #000099;text-decoration: none;font-family:Arial;margin: 0px;border: 0px none;font-size: 10px;height: 13px;width: 99px;"></td>
            <td rowspan="6"><img name="top2_r2_c19" src="/images/top2_r2_c19.gif" width="13" height="21" border="0" alt=""></td>
            <td rowspan="4"><INPUT TYPE="Image"img name="top2_r2_c20" src="/images/top2_r2_c20.gif" width="37" height="16" border="0" alt=""></td>
            <td rowspan="6"><img name="top2_r2_c21" src="/images/top2_r2_c21.gif" width="27" height="21" border="0" alt=""></td>
            <td rowspan="5"><a href="http://www.rai.it"><img src="/images/top2_r2_c22.gif" alt="" name="top2_r2_c22" width="48" height="17" border="0" usemap="#top2_r2_c22Map"></a></td>
            <td rowspan="6"><img name="top2_r2_c23" src="/images/top2_r2_c23.gif" width="9" height="21" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="1" height="4" border="0" alt=""></td>
          </tr>
          <tr> 
            <td rowspan="5"><img name="top2_r3_c1" src="/images/top2_r3_c1.gif" width="10" height="17" border="0" alt=""></td>
            <td><a href="http://www.rai.it/tv" target="_top" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','top2_r3_c2','/images/top2_r3_c2_f2.gif','/images/top2_r3_c2_f3.gif',1)" onClick="MM_nbGroup('down','navbar1','top2_r3_c2','/images/top2_r3_c2_f3.gif',1);"><img name="top2_r3_c2" src="/images/top2_r3_c2.gif" width="13" height="7" border="0" alt=""></a></td>
            <td rowspan="5"><img name="top2_r3_c3" src="/images/top2_r3_c3.gif" width="22" height="17" border="0" alt=""></td>
            <td><a href="http://www.radio.rai.it" target="_top" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','top2_r3_c4','/images/top2_r3_c4_f2.gif','/images/top2_r3_c4_f3.gif',1)" onClick="MM_nbGroup('down','navbar1','top2_r3_c4','/images/top2_r3_c4_f3.gif',1);"><img name="top2_r3_c4" src="/images/top2_r3_c4.gif" width="35" height="7" border="0" alt=""></a></td>
            <td rowspan="5"><img name="top2_r3_c5" src="/images/top2_r3_c5.gif" width="25" height="17" border="0" alt=""></td>
            <td><a href="http://www.rai.it/news" target="_top" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','top2_r3_c6','/images/top2_r3_c6_f2.gif','/images/top2_r3_c6_f3.gif',1);" onClick="MM_nbGroup('down','navbar1','top2_r3_c6','/images/top2_r3_c6_f3.gif',1);"><img name="top2_r3_c6" src="/images/top2_r3_c6.gif" width="29" height="7" border="0" alt=""></a></td>
            <td rowspan="5"><img name="top2_r3_c7" src="/images/top2_r3_c7.gif" width="22" height="17" border="0" alt=""></td>
            <td><a href="http://www.community.rai.it" target="_top" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','top2_r3_c8','/images/top2_r3_c8_f2.gif','/images/top2_r3_c8_f3.gif',1)" onClick="MM_nbGroup('down','navbar1','top2_r3_c8','/images/top2_r3_c8_f3.gif',1);"><img name="top2_r3_c8" src="/images/top2_r3_c8.gif" width="60" height="7" border="0" alt=""></a></td>
            <td rowspan="5"><img name="top2_r3_c9" src="/images/top2_r3_c9.gif" width="19" height="17" border="0" alt=""></td>
            <td><a href="http://www.junior.rai.it" target="_top" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','top2_r3_c10','/images/top2_r3_c10_f2.gif','/images/top2_r3_c10_f3.gif',1)" onClick="MM_nbGroup('down','navbar1','top2_r3_c10','/images/top2_r3_c10_f3.gif',1);"><img name="top2_r3_c10" src="/images/top2_r3_c10.gif" width="40" height="7" border="0" alt=""></a></td>
            <td rowspan="5"><img name="top2_r3_c11" src="/images/top2_r3_c11.gif" width="21" height="17" border="0" alt=""></td>
            <td><a href="http://www.teche.rai.it" target="_top" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','top2_r3_c12','/images/top2_r3_c12_f2.gif','/images/top2_r3_c12_f3.gif',1)" onClick="MM_nbGroup('down','navbar1','top2_r3_c12','/images/top2_r3_c12_f3.gif',1);"><img name="top2_r3_c12" src="/images/top2_r3_c12.gif" width="30" height="7" border="0" alt=""></a></td>
            <td rowspan="5"><img name="top2_r3_c13" src="/images/top2_r3_c13.gif" width="22" height="17" border="0" alt=""></td>
            <td><a href="http://www.rai.it/mappasiti" target="_top" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','top2_r3_c14','/images/top2_r3_c14_f2.gif','/images/top2_r3_c14_f3.gif',1)" onClick="MM_nbGroup('down','navbar1','top2_r3_c14','/images/top2_r3_c14_f3.gif',1);"><img name="top2_r3_c14" src="/images/top2_r3_c14.gif" width="58" height="7" border="0" alt=""></a></td>
            <td rowspan="5"><img name="top2_r3_c15" src="/images/top2_r3_c15.gif" width="17" height="17" border="0" alt=""></td>
            <td><a href="http://www.rai.it/programmiaz" target="_top" onMouseOut="MM_nbGroup('out');" onMouseOver="MM_nbGroup('over','top2_r3_c16','/images/top2_r3_c16_f2.gif','/images/top2_r3_c16_f3.gif',1)" onClick="MM_nbGroup('down','navbar1','top2_r3_c16','/images/top2_r3_c16_f3.gif',1);"><img name="top2_r3_c16" src="/images/top2_r3_c16.gif" width="86" height="7" border="0" alt=""></a></td>
            <td rowspan="5"><img name="top2_r3_c17" src="/images/top2_r3_c17.gif" width="29" height="17" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="1" height="7" border="0" alt=""></td>
          </tr>
          <tr> 
            <td rowspan="4"><img name="top2_r4_c2" src="/images/top2_r4_c2.gif" width="13" height="10" border="0" alt=""></td>
            <td rowspan="4"><img name="top2_r4_c4" src="/images/top2_r4_c4.gif" width="35" height="10" border="0" alt=""></td>
            <td rowspan="4"><img name="top2_r4_c6" src="/images/top2_r4_c6.gif" width="29" height="10" border="0" alt=""></td>
            <td rowspan="4"><img name="top2_r4_c8" src="/images/top2_r4_c8.gif" width="60" height="10" border="0" alt=""></td>
            <td rowspan="4"><img name="top2_r4_c10" src="/images/top2_r4_c10.gif" width="40" height="10" border="0" alt=""></td>
            <td rowspan="4"><img name="top2_r4_c12" src="/images/top2_r4_c12.gif" width="30" height="10" border="0" alt=""></td>
            <td rowspan="4"><img name="top2_r4_c14" src="/images/top2_r4_c14.gif" width="58" height="10" border="0" alt=""></td>
            <td rowspan="4"><img name="top2_r4_c16" src="/images/top2_r4_c16.gif" width="86" height="10" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="1" height="4" border="0" alt=""></td>
          </tr>
          <tr> 
            <td rowspan="3"><img name="top2_r5_c18" src="/images/top2_r5_c18.gif" width="99" height="6" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
          </tr>
          <tr> 
            <td rowspan="2"><img name="top2_r6_c20" src="/images/top2_r6_c20.gif" width="37" height="5" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="1" height="1" border="0" alt=""></td>
          </tr>
          <tr> 
            <td><img name="top2_r7_c22" src="/images/top2_r7_c22.gif" width="48" height="4" border="0" alt=""></td>
            <td><img src="/images/spacer.gif" width="1" height="4" border="0" alt=""></td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>




<map name="top2_r2_c22Map">
  <area shape="rect" coords="1,2,44,18" href="http://www.rai.it">
</map>
<script language="JavaScript1.2">mmLoadMenus();</script>
<table width="763" border="0" align="center" cellpadding="0" cellspacing="0">
  <!-- fwtable fwsrc="/radio1/images/top_provvisorio_Maggio2006.png" fwbase="top_provvisorio_Maggio2006.gif" fwstyle="Dreamweaver" fwdocid = "1549025416" fwnested="0" -->
  <tr>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="8" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="66" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="12" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="38" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="28" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="7" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="66" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="7" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="66" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="10" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="66" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="10" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="50" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="10" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="50" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="12" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="71" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="10" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="5" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="12" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="3" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="51" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="8" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="48" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="39" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="5" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="5" height="1" border="0"></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="1" border="0"></td>
  </tr>
  <tr>
    <td colspan="27"><img name="top_provvisorio_Maggio2006_r1_c1" src="/radio1/images/top_provvisorio_Maggio2006_r1_c1.gif" width="763" height="12" border="0" alt=""></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="12" border="0"></td>
  </tr>
  <tr>
    <td rowspan="5" colspan="4"><a href="/radio1/"><img name="top_provvisorio_Maggio2006_r2_c1" src="/radio1/images/top_provvisorio_Maggio2006_r2_c1.gif" width="124" height="75" border="0" alt="Torna in home page di Radio1"></a></td>
    <td rowspan="4" colspan="15">
	  <table width="468" height="60" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
		   <div align="center">
                  <script>var rnd=Math.floor(1000*Math.random()+1);document.write('<IFRAME WIDTH=468 HEIGHT=60 MARGINWIDTH=0 MARGINHEIGHT=0 HSPACE=0  VSPACE=0 FRAMEBORDER=0 SCROLLING=no BORDERCOLOR="#000000"  SRC="http://www.banneradmin.rai.it/html.ng/sezione_RAI=radiorai&subsezione_RAI=radiouno&dimBanner=468x60&posBanner=up&rnd='+rnd+'">');var rnd=Math.floor(1000*Math.random()+1);document.write('<SCRIPT LANGUAGE="JavaScript1.1" SRC="http://www.banneradmin.rai.it/js.ng/Params.Richmedia=yes&sezione_RAI=radiorai&subsezione_RAI=radiouno&dimBanner=468x60&posBanner=up&rnd='+rnd+'"><'+'/SCRIP'+'T>');document.write("</IFRAME>");</script>
                  <noscript>
                  <script>var rnd=Math.floor(1000*Math.random()+1);document.write('<AHREF="http://www.banneradmin.rai.it/click.ng/Params.Richmedia=yes&sezione_RAI=radiorai&subsezione_RAI=radiouno&dimBanner=468x60&posBanner=up&rnd='+rnd+'"><IMGSRC="http://www.banneradmin.rai.it/image.ng/Params.Richmedia=yes&sezione_RAI=radiorai&subsezione_RAI=radiouno&dimBanner=468x60&posBanner=up&rnd='+rnd+'"> </A>');</script>
                  </noscript>
                  <!-- /AdSpace -->
            </div>
		  </td>
        </tr>
      </table>	</td>
    <td colspan="8"><img name="top_provvisorio_Maggio2006_r2_c20" src="/radio1/images/top_provvisorio_Maggio2006_r2_c20.gif" width="171" height="2" border="0" alt=""></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="2" border="0"></td>
  </tr>
  <tr>
    <td rowspan="2" colspan="2"><img name="top_provvisorio_Maggio2006_r3_c20" src="/radio1/images/top_provvisorio_Maggio2006_r3_c20.gif" width="15" height="28" border="0" alt=""></td>
    <td colspan="3"><img src="/radio1/images/top_provvisorio_Maggio2006_r3_c22.gif" alt="" name="top_provvisorio_Maggio2006_r3_c22" width="107" height="10" border="0" usemap="#top_provvisorio_Maggio2006_r3_c22Map"></td>
    <td rowspan="2" colspan="3"><img name="top_provvisorio_Maggio2006_r3_c25" src="/radio1/images/top_provvisorio_Maggio2006_r3_c25.gif" width="49" height="28" border="0" alt=""></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="10" border="0"></td>
  </tr>
  <tr>
    <td colspan="3"><img name="top_provvisorio_Maggio2006_r4_c22" src="/radio1/images/top_provvisorio_Maggio2006_r4_c22.gif" width="107" height="18" border="0" alt=""></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="18" border="0"></td>
  </tr>
  <tr>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r5_c20" src="/radio1/images/top_provvisorio_Maggio2006_r5_c20.gif" width="12" height="45" border="0" alt=""></td>
    <td colspan="5"><table width="149" height="30" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top">
<style type="text/css">
#TESTO-ORAINONDA{
font-family:Verdana, Arial, Helvetica, sans-serif;
font-size:10px;
line-height:13px;
margin-top:0px;
margin-left:3px;
width:146px;
height:27px;
overflow:auto;
}
a{
color:#990000;
text-decoration:none;
}
.Stile1 {color: #990000;text-decoration:none;}
.Stile1 a:link{color: #990000; text-decoration:none;}
.Stile1 a:hover{color: #990000; text-decoration:underline;}
</style>
<div id="TESTO-ORAINONDA">
 
      <!-- calcola canale richiesto --->
      20:08 ASCOLTA SI FA SERA<br/> 
                        21:00 segue  DIRETTISSIMA MONDIALI   -  Francia - Repubblica di Corea<br/> 
                        21:49 GR 1<br/> 
                        23:00 GR 1<br/> 
                        23:09 RADIOUNO MUSICA<br/> 
                        23:33 
                              <font color="990000" class="Stile1"><a href="http://www.radio.rai.it/radioscrigno/" target="_top">RADIOSCRIGNO</a></font><br/>
 23:52 OGGI DUEMILA LA BIBBIA<br/> 
                        00:00 GR MEZZANOTTE<br/> 
                        01:00 LA NOTTE DI  RADIOUNO<br/> 
                        02:00 GR 1<br/> 
                         
</div>

		</td>
      </tr>
    </table></td>
    <td rowspan="2" colspan="2"><img name="top_provvisorio_Maggio2006_r5_c26" src="/radio1/images/top_provvisorio_Maggio2006_r5_c26.gif" width="10" height="45" border="0" alt=""></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="30" border="0"></td>
  </tr>
  <tr>
    <td colspan="15"><img name="top_provvisorio_Maggio2006_r6_c5" src="/radio1/images/top_provvisorio_Maggio2006_r6_c5.gif" width="468" height="15" border="0" alt=""></td>
    <td colspan="5"><img name="top_provvisorio_Maggio2006_r6_c21" src="/radio1/images/top_provvisorio_Maggio2006_r6_c21.gif" width="149" height="15" border="0" alt=""></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="15" border="0"></td>
  </tr>
  <tr>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c1" src="/radio1/images/top_provvisorio_Maggio2006_r7_c1.gif" width="8" height="15" border="0" alt=""></td>
    <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506141907_0,-8,16,null,'top_provvisorio_Maggio2006_r7_c2');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c2" src="/radio1/images/top_provvisorio_Maggio2006_r7_c2.gif" width="66" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c3" src="/radio1/images/top_provvisorio_Maggio2006_r7_c3.gif" width="12" height="15" border="0" alt=""></td>
    <td colspan="2"><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142331_1,0,16,null,'top_provvisorio_Maggio2006_r7_c4');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c4" src="/radio1/images/top_provvisorio_Maggio2006_r7_c4.gif" width="66" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c6" src="/radio1/images/top_provvisorio_Maggio2006_r7_c6.gif" width="7" height="15" border="0" alt=""></td>
    <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142437_2,0,16,null,'top_provvisorio_Maggio2006_r7_c7');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c7" src="/radio1/images/top_provvisorio_Maggio2006_r7_c7.gif" width="66" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c8" src="/radio1/images/top_provvisorio_Maggio2006_r7_c8.gif" width="7" height="15" border="0" alt=""></td>
    <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142511_3,0,16,null,'top_provvisorio_Maggio2006_r7_c9');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c9" src="/radio1/images/top_provvisorio_Maggio2006_r7_c9.gif" width="66" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c10" src="/radio1/images/top_provvisorio_Maggio2006_r7_c10.gif" width="10" height="15" border="0" alt=""></td>
    <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142600_4,0,16,null,'top_provvisorio_Maggio2006_r7_c11');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c11" src="/radio1/images/top_provvisorio_Maggio2006_r7_c11.gif" width="66" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c12" src="/radio1/images/top_provvisorio_Maggio2006_r7_c12.gif" width="10" height="15" border="0" alt=""></td>
    <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142625_5,0,16,null,'top_provvisorio_Maggio2006_r7_c13');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c13" src="/radio1/images/top_provvisorio_Maggio2006_r7_c13.gif" width="50" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c14" src="/radio1/images/top_provvisorio_Maggio2006_r7_c14.gif" width="10" height="15" border="0" alt=""></td>
    <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142646_6,0,16,null,'top_provvisorio_Maggio2006_r7_c15');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c15" src="/radio1/images/top_provvisorio_Maggio2006_r7_c15.gif" width="50" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c16" src="/radio1/images/top_provvisorio_Maggio2006_r7_c16.gif" width="12" height="15" border="0" alt=""></td>
    <td><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142730_7,0,16,null,'top_provvisorio_Maggio2006_r7_c17');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c17" src="/radio1/images/top_provvisorio_Maggio2006_r7_c17.gif" width="71" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c18" src="/radio1/images/top_provvisorio_Maggio2006_r7_c18.gif" width="10" height="15" border="0" alt=""></td>
    <td colspan="4"><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142750_8,0,16,null,'top_provvisorio_Maggio2006_r7_c19');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c19" src="/radio1/images/top_provvisorio_Maggio2006_r7_c19.gif" width="71" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c23" src="/radio1/images/top_provvisorio_Maggio2006_r7_c23.gif" width="8" height="15" border="0" alt=""></td>
    <td colspan="3"><a href="#" onMouseOut="MM_startTimeout();" onMouseOver="MM_showMenu(window.mm_menu_0506142812_9,-27,16,null,'top_provvisorio_Maggio2006_r7_c24');" style="cursor:default; "><img name="top_provvisorio_Maggio2006_r7_c24" src="/radio1/images/top_provvisorio_Maggio2006_r7_c24.gif" width="92" height="13" border="0" alt=""></a></td>
    <td rowspan="2"><img name="top_provvisorio_Maggio2006_r7_c27" src="/radio1/images/top_provvisorio_Maggio2006_r7_c27.gif" width="5" height="15" border="0" alt=""></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="13" border="0"></td>
  </tr>
  <tr>
    <td><img name="top_provvisorio_Maggio2006_r8_c2" src="/radio1/images/top_provvisorio_Maggio2006_r8_c2.gif" width="66" height="2" border="0" alt=""></td>
    <td colspan="2"><img name="top_provvisorio_Maggio2006_r8_c4" src="/radio1/images/top_provvisorio_Maggio2006_r8_c4.gif" width="66" height="2" border="0" alt=""></td>
    <td><img name="top_provvisorio_Maggio2006_r8_c7" src="/radio1/images/top_provvisorio_Maggio2006_r8_c7.gif" width="66" height="2" border="0" alt=""></td>
    <td><img name="top_provvisorio_Maggio2006_r8_c9" src="/radio1/images/top_provvisorio_Maggio2006_r8_c9.gif" width="66" height="2" border="0" alt=""></td>
    <td><img name="top_provvisorio_Maggio2006_r8_c11" src="/radio1/images/top_provvisorio_Maggio2006_r8_c11.gif" width="66" height="2" border="0" alt=""></td>
    <td><img name="top_provvisorio_Maggio2006_r8_c13" src="/radio1/images/top_provvisorio_Maggio2006_r8_c13.gif" width="50" height="2" border="0" alt=""></td>
    <td><img name="top_provvisorio_Maggio2006_r8_c15" src="/radio1/images/top_provvisorio_Maggio2006_r8_c15.gif" width="50" height="2" border="0" alt=""></td>
    <td><img name="top_provvisorio_Maggio2006_r8_c17" src="/radio1/images/top_provvisorio_Maggio2006_r8_c17.gif" width="71" height="2" border="0" alt=""></td>
    <td colspan="4"><img name="top_provvisorio_Maggio2006_r8_c19" src="/radio1/images/top_provvisorio_Maggio2006_r8_c19.gif" width="71" height="2" border="0" alt=""></td>
    <td colspan="3"><img name="top_provvisorio_Maggio2006_r8_c24" src="/radio1/images/top_provvisorio_Maggio2006_r8_c24.gif" width="92" height="2" border="0" alt=""></td>
    <td><img src="/radio1/images/spacer.gif" alt="" name="undefined_2" width="1" height="2" border="0"></td>
  </tr>
</table>
<map name="top_provvisorio_Maggio2006_r3_c22Map">
  <area shape="rect" coords="3,1,105,9" href="#" onClick="MM_openBrWindow('/player/player.cfm?Q_CANALE=1','RadioRaiPlayer','status=yes,resizable=yes,width=500,height=421')">
</map>

<div align="center"> 
  <table width="760" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top"> 
      <td colspan="2" bgcolor="FFFFFF"><table width="760" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td colspan="2" valign="top" bgcolor="cccccc"> <table width="600" border="0" cellpadding="0" cellspacing="0">
                <tr > 
                  <td width="192" height="6" valign="top" background="images/bg_pod1.gif"> 
                  </td>
                </tr>
                <tr >
                  <td valign="top" background="images/bg_home_01.gif"><table border="0" cellpadding="1" cellspacing="0" width="100%">
                      <tr>
                        <td background="images/bg_blu.gif" bgcolor="#003366"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" background="">
                            <tr bgcolor="669999">
                              <td bgcolor="003366"><table width="100%" border="0" cellspacing="0" cellpadding="2">
                                  <tr>
                                    <td><span class="Boxtitoli">RADIO1 PODCAST</span></td>
                                  </tr>
                              </table></td>
                            </tr>
                        </table></td>
                      </tr>
                  </table></td>
                </tr>
                <tr >
                  <td height="6" valign="top" background="images/bg_pod1.gif" > </td>
                </tr>
                <tr >
                  <td valign="top"><table width="100%" border="0" cellpadding="1" cellspacing="0" bgcolor="#000000">
                      <tr>
                        <td><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td><table width="100%" height="25" border="0" cellpadding="2" cellspacing="0">
                                  <tr>
                                    <td bgcolor="#FFFFFF"> <span class="alfabetico">

La radio ne parla 
	</span></td>
                                  </tr>
                              </table></td>
                            </tr>
                            <tr bgcolor="669999">
                              <td valign="top" bgcolor="#FFFFFF" class="Boxtitoli">
                                <table width="100%" border="0" cellpadding="1" cellspacing="0" background="">
                                

<tr bgcolor="#00b9b9" class="titoloscroll2">
	<td width="15%"><a href="http://www.radio.rai.it/podcast/F0002901.mp3"><img border="0" src="../../radio1/podcast/images/mp3a.gif" height="22"></a></td>
	<td width="85%"><span class="boxcontenuti"><font color="000000"><B>La radio ne parla del 14 giugno 2006</B><br>
	Estorsioni: un'economia con il freno a mano tirato<br><br>
Avevamo deciso di parlare di racket qualche settimana fa con l'obiettivo di tenere vivo l'interesse per un argomento che spesso rischia di cadere nel dimenticatoio. Ma purtroppo ci ha pensato la cronaca più nuda e cruda a ricordare all'Italia intera che ci sono zone d'Italia dove fare l'imprenditore può divenire una questione di vita o di morte. </font></span></td>
</tr>
<tr><td height="2"></td></tr>
	
<tr bgcolor="#00b9b9" class="titoloscroll2">
	<td width="15%"><a href="http://www.radio.rai.it/podcast/F0002900.mp3"><img border="0" src="../../radio1/podcast/images/mp3a.gif" height="22"></a></td>
	<td width="85%"><span class="boxcontenuti"><font color="000000"><B>La radio ne parla del 13 giugno 2006 </B><br>
	C'era una volta una gatta...<br><br>  
I gatti in Italia sono protetti. Almeno sulla carta. Una legge nazionale (la 281/91), leggi regionali e provvedimenti comunali un po' dovunque sanciscono tutti lo stesso valore: il gatto è un animale riconosciuto libero, da tutelare sul territorio dove risiede; non solo per una questione etico - animalista, ma anche per la sua indiscussa capacità di tenere lontani altri animali sgraditi. Eppure, di fatto, i gatti sono animali dimenticati dalle istituzioni. 
</font></span></td>
</tr>
<tr><td height="2"></td></tr>
	
<tr bgcolor="#00b9b9" class="titoloscroll2">
	<td width="15%"><a href="http://www.radio.rai.it/podcast/F0002842.mp3"><img border="0" src="../../radio1/podcast/images/mp3a.gif" height="22"></a></td>
	<td width="85%"><span class="boxcontenuti"><font color="000000"><B>La radio ne parla del 12 giugno 2006</B><br>
	Sicurezza anche in vacanza<br><br>In base all'ultimo censimento Istat del 2001, le casalinghe sono 7 milioni e 478 mila, il 15,3% della popolazione residente in Italia maggiore di 15 anni. Un dato in calo rispetto al censimento precedente, quello che del 1991, che registrava 9 milioni e 255mila, il 19,4% degli over 15 italiani. Aumentano, di converso, le donne di tutte le fasce d'età che lavorano, con un incremento particolarmente importante nelle fasce 30-34 anni (+8%), 40-44 (+10%), 45-49 (+13%) e 50-54 (+11%). Nel 2001 le donne occupate rappresentano il 38,8% del totale degli occupati (8.151.761 unità).</font></span></td>
</tr>
<tr><td height="2"></td></tr>
	
                              </table></td>
                            </tr>
                        </table></td>
                      </tr>
                  </table></td>
                </tr>
                <tr >
                  <td height="6" valign="top" background="images/bg_pod1.gif" > </td>
                </tr>
		
                
                   
                
                
                
                
                <tr > 
                  <td height="20" valign="top" background="images/bg_pod1.gif"> 
                  </td>
                </tr>
              </table></td>
            <td width="148" align="left" valign="top" background="images/bg_home_2lungo.gif"> 
              <table width="148" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td height="6"></td>
                </tr>
				

				
                <tr> 
                  <td valign="top" background="images/bg_home_01.gif"><table width="145" border="0" cellpadding="1" cellspacing="0">
                      <tr> 
                        <td valign="top" background="images/bg_nero.gif"> <table width="100%"  border="0" align="center" cellpadding="2" cellspacing="0" background="">
                            <tr bgcolor="669999"> 
                              <td bgcolor="003366" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr> 
                                      <td><span class="Boxtitoli">CHE COSA E' IL PODCAST</span></td>
                                  </tr>
                                </table></td>
                            </tr>
                            <tr bgcolor="FFFFFF"> 
                              <td align="right" valign="top" bgcolor="003366"> 
                                <a href="http://it.wikipedia.org/wiki/Podcast" target="_blank" class="linkaggi">
                                leggi &gt;&gt;&gt;</a></td>
                            </tr>
                          </table>
					    </td>
                      </tr>
                    </table></td>
                </tr>



                <tr bgcolor=> 
                    <td width="192" height="6" valign="top"> </td>
                </tr>
				

				
                
                <tr> 
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td width="191" valign="top" background="images/bg_home_01.gif"><img src="images/blankpix.gif" width="190" height="1"></td>
            <td width="421" align="center" valign="top" bgcolor="CCCCCC"><img src="images/blankpix.gif" width="421" height="1"></td>
            <td align="left" valign="top" background="images/bg_home_2lungo.gif"><img src="images/blankpix.gif" width="145" height="1"></td>
          </tr>
        </table> </td>
    </tr>
    <tr> 
      <td width="735" height="1" align="left" valign="top"><img src="images/tilenero_index_radio1_2.gif" width="760" height="1"></td>
  
    </tr>
    <tr> 
      <td colspan="2" align="center" valign="top"><table width="600" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="564" align="center"><font face="Verdana, Arial, Helvetica, sans-serif, Tahoma" size="1">Realizzato 
              da Rainet</font> </tr>
        </table></td>
    </tr>
  </table>
  
</div>
<!-- START RedMeasure V4 - Java v1.1  Revision: 1.8 -->
<!-- COPYRIGHT 2000 Red Sheriff Limited -->

<script language="JavaScript">
<!--
  var pCid="it_rainet-it_0";
  var w0=1;
  var refR=escape(document.referrer);
  if (refR.length>=252) refR=refR.substring(0,252)+"...";
//-->
</script>

<script language="JavaScript1.1">
<!--
  var w0=0;
//-->
</script>

<script language="JavaScript1.1" src="http://server-it.imrworldwide.com/a1.js">
</script>

<script language="JavaScript">
<!--
  if(w0){
  var imgN='<img src="http://server-it.imrworldwide.com/cgi-bin/count?ref='+ refR+'&cid='+pCid+'" width=1 height=1>';
  if(navigator.userAgent.indexOf('Mac')!=-1){document.write(imgN);
  }else{
   document.write('<applet code="Measure.class" '+ 'codebase="http://server-it.imrworldwide.com/"'+'width=1 height=2>'+
 '<param name="ref" value="'+refR+'">'+'<param name="cid" value="'+pCid+'"><textflow>'+imgN+'</textflow></applet>');
 }
}
document.write("<COMMENT>");
//-->

</script>
<noscript>
<img src="http://server-it.imrworldwide.com/cgi-bin/count?cid=it_rainet-it_0" alt="." width=1 height=1> 
</noscript>
</COMMENT>

<!-- END RedMeasure V4 -->
</body>
</html>
