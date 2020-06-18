inherited FrmBaseCRUD: TFrmBaseCRUD
  Caption = 'FrmBaseCRUD'
  ClientHeight = 397
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitHeight = 436
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar [0]
    Left = 0
    Top = 378
    Width = 762
    Height = 19
    Panels = <>
    ExplicitLeft = 416
    ExplicitTop = 340
    ExplicitWidth = 0
  end
  object DsQuery: TDataSource
    Left = 160
    Top = 256
  end
  object DsCrud: TDataSource
    Left = 304
    Top = 260
  end
end
