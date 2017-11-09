library("kwb.utils")
library("xml2")

paths <- resolve(list(
  wp = "//poseidon/projekte$/AUFTRAEGE/RELIABLE_SEWER/Data-Work packages", 
  root = "<wp>/T_11_Data_Collection/20_Sofia/05_Exchange/2017_11_08_from_JK",
  xml_1 = "<root>/BEFDSS_Beispieldaten_20171103.xml",
  xml_2 = "<root>/Muster_M150_Typ-B.xml"
))

# M A I N ----------------------------------------------------------------------
if (FALSE)
{
  content <- read_xml_dwa_m150(xml = safePath(paths$xml_2))
}
