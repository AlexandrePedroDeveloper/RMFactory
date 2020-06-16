object Form1: TForm1
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 0
  Caption = 'Form1'
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
    Enabled = False
    Interval = 10
    OnTimer = FadeinTimer
    Left = 384
    Top = 136
  end
  object FadeOut: TTimer
    Enabled = False
    Interval = 10
    OnTimer = FadeOutTimer
    Left = 464
    Top = 136
  end
end
