object dmUsuario: TdmUsuario
  OldCreateOrder = False
  Height = 580
  Width = 1019
  object dbConnMySQL: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Password=123456'
      'User_Name=luzanilton'
      'Database=fc_unit')
    TxOptions.AutoStop = False
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 304
  end
  object insUsuario: TFDCommand
    Connection = dbConnMySQL
    Left = 288
    Top = 312
  end
  object qryUsuario: TFDQuery
    Connection = dbConnMySQL
    Left = 456
    Top = 312
  end
  object tbUsuario: TFDTable
    Active = True
    IndexFieldNames = 'email'
    Connection = dbConnMySQL
    TableName = 'fc_unit.usuarios'
    Left = 608
    Top = 312
  end
end
