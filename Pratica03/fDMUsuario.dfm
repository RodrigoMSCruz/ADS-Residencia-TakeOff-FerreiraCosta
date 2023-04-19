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
    Connected = True
    LoginPrompt = False
    Left = 104
    Top = 304
  end
  object insUsuario: TFDCommand
    Connection = dbConnMySQL
    Left = 184
    Top = 304
  end
  object qryUsuario: TFDQuery
    Connection = dbConnMySQL
    Left = 352
    Top = 304
  end
  object tbUsuario: TFDTable
    Active = True
    IndexFieldNames = 'email'
    Connection = dbConnMySQL
    TableName = 'fc_unit.usuarios'
    Left = 504
    Top = 304
  end
end
