object FrmBaseForm: TFrmBaseForm
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 0
  Caption = 'FrmBaseForm'
  ClientHeight = 484
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Fadein: TTimer
    Interval = 10
    OnTimer = FadeinTimer
    Left = 344
    Top = 144
  end
  object FadeOut: TTimer
    Enabled = False
    Interval = 10
    OnTimer = FadeOutTimer
    Left = 424
    Top = 144
  end
end
