object DM: TDM
  OldCreateOrder = False
  Height = 573
  Width = 509
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=sfc_bd'
      'User_Name=root'
      'Password=root'
      'DriverID=MySQL')
    Left = 40
    Top = 32
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\RodrigoMSCruz\Documents\Residencia-TakeOff-FerreiraCost' +
      'a\Repository\Avaliacao\libmysql.dll'
    Left = 376
    Top = 24
  end
end
