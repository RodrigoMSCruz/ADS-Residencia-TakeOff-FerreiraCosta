object dmUsuario: TdmUsuario
  OldCreateOrder = False
  Height = 580
  Width = 1019
  object ferreiracosta_db: TFDConnection
    Params.Strings = (
      'DriverID=MySQL'
      'Password=123456'
      'User_Name=luzanilton'
      'Database=fc_unit')
    LoginPrompt = False
    Left = 104
    Top = 304
  end
  object insUsuario: TFDCommand
    Connection = ferreiracosta_db
    Left = 184
    Top = 304
  end
  object qryUsuario: TFDQuery
    Connection = ferreiracosta_db
    Left = 352
    Top = 304
  end
  object tbUsuario: TFDTable
    IndexFieldNames = 'email'
    Connection = ferreiracosta_db
    TableName = 'fc_unit.usuarios'
    Left = 504
    Top = 304
  end
end
