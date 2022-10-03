class People {

  int f24 = 00;
  int fMinute = 00;
  int fSecond = 01;
  
  //change csv in eif1 to hc for utc time
  String eif1 = "https://eif-research.feit.uts.edu.au/api/csv/?";
  String eif2 = "&rFamily=people_sh&rSensor=";
  String BrSensor = "CB11.PC02.14.Broadway&rSubSensor=CB11.02.Broadway.East+";
  String WaSensor = "CB11.PC00.06.West&rSubSensor=CB11.00.Wattle+";
  String JoSensor = "CB11.PC02.16.JonesStEast&rSubSensor=CB11.02.JonesSt+";
  //String InOut = "In";
  String eif3 = "#collaspeOne";
  
  
  
  void eif(String Year, String Month, String Day, String t24, String tMinute,String tSecond){
    String FromDate = "rFromDate=" + Year + "-" + Month + "-" + Day + "T" + f24 + "%3A" + fMinute + "%3A" + fSecond + "&";
    String ToDate = "rToDate=" + Year + "-" + Month + "-" + Day + "T" + t24 + "%3A" + tMinute + "%3A" + tSecond;
    //String eifFull = eif1 + FromDate + ToDate + eif2 + Sensor + InOut + eif3;
  
    BrIn = eif1 + FromDate + ToDate + eif2 + BrSensor + "In" + eif3;
    BrOut = eif1 + FromDate + ToDate + eif2 + BrSensor + "Out" + eif3;
    JoIn = eif1 + FromDate + ToDate + eif2 + JoSensor + "In" + eif3;
    JoOut = eif1 + FromDate + ToDate + eif2 + JoSensor + "Out" + eif3;
    WaIn = eif1 + FromDate + ToDate + eif2 + WaSensor + "In" + eif3;
    WaOut = eif1 + FromDate + ToDate + eif2 + WaSensor + "Out" + eif3;
    loadTables();
    //return eifFull;
  }

  void loadTables(){
    Table BroadwayIn = loadTable(BrIn, "csv");
    int BIn = 0;
    while (BIn < BroadwayIn.getRowCount()){
      String BrInTime = BroadwayIn.getString(BIn,0);
      try{
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = df.parse(BrInTime);
        long epoch = date.getTime();
        BroadwayIn.setFloat(BIn,0,epoch);
        }
    catch (java.text.ParseException e){
      e.printStackTrace();
    }
    BIn++;
  }
  
  //saveTable(BroadwayIn, "Broadway.csv");
  Table BroadwayOut = loadTable(BrOut, "csv");
    int BOn = 0;
  while (BOn < BroadwayOut.getRowCount()){
    String BrOutTime = BroadwayOut.getString(BOn,0);
        try{
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = df.parse(BrOutTime);
    long epoch = date.getTime();
    BroadwayOut.setFloat(BOn,0,epoch);
        }
    catch (java.text.ParseException e){e.printStackTrace();}
    
    BOn++;
  }
  
  Table JonesIn = loadTable(JoIn, "csv");
    int JIn = 0;
  while (JIn < JonesIn.getRowCount()){
    String JoInTime = JonesIn.getString(JIn,0);
        try{
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = df.parse(JoInTime);
    long epoch = date.getTime();
    JonesIn.setFloat(JIn,0,epoch);
        }
    catch (java.text.ParseException e){e.printStackTrace();}
    
    JIn++;
  }
  Table JonesOut =loadTable(JoOut, "csv");
  int JOn = 0;
  while (JOn < JonesOut.getRowCount()){
    String JoOutTime = JonesOut.getString(JOn,0);
        try{
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = df.parse(JoOutTime);
    long epoch = date.getTime();
    JonesOut.setFloat(JOn,0,epoch);
        }
    catch (java.text.ParseException e){e.printStackTrace();}
    
    JOn++;
  }
  
  Table WattleIn = loadTable(WaIn, "csv");
  int WIn = 0;
  while (WIn < WattleIn.getRowCount()){
    String WaInTime = WattleIn.getString(WIn,0);
        try{
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = df.parse(WaInTime);
    long epoch = date.getTime();
    WattleIn.setFloat(WIn,0,epoch);
        }
    catch (java.text.ParseException e){e.printStackTrace();}
    
    WIn++;
  }
  Table WattleOut = loadTable(WaOut, "csv");
    int WOn = 0;
  while (WOn < WattleOut.getRowCount()){
    String WaOutTime = WattleOut.getString(WOn,0);
        try{
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    Date date = df.parse(WaOutTime);
    long epoch = date.getTime();
    WattleOut.setFloat(WOn,0,epoch);
        }
    catch (java.text.ParseException e){e.printStackTrace();}
    
    WOn++;
  }
}








}
