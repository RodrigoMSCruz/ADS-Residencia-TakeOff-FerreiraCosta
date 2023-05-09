object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 573
  Width = 509
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=sfc_bd;Data Source=DESKTOP-0CB2SE4\SQLEXPRESS;Use Pr' +
      'ocedure for Prepare=1;Auto Translate=True;Packet Size=4096;Works' +
      'tation ID=DESKTOP-0CB2SE4;Initial File Name="";Use Encryption fo' +
      'r Data=False;Tag with column collation when possible=False;MARS ' +
      'Connection=False;DataTypeCompatibility=0;Trust Server Certificat' +
      'e=False;Server SPN="";Application Intent=READWRITE'
    Provider = 'SQLNCLI11.1'
    Left = 40
    Top = 24
  end
  object dsPedidoVenda: TDataSource
    DataSet = ADOQryPedidoVenda
    Left = 48
    Top = 208
  end
  object ADOQryPedidoVenda: TADOQuery
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    Left = 48
    Top = 144
  end
  object ADOCommandPedidoVenda: TADOCommand
    Parameters = <>
    Left = 176
    Top = 144
  end
end
