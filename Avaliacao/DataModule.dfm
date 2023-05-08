object DM: TDM
  OldCreateOrder = False
  Height = 573
  Width = 509
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=sfc_bd;Data Source=DESKTOP-0CB2SE4\SQLEXPRESS;Initia' +
      'l File Name="";Server SPN=""'
    Provider = 'SQLNCLI11.1'
    Left = 40
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM PRODUTO')
    Left = 40
    Top = 112
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 112
    Top = 112
  end
end
