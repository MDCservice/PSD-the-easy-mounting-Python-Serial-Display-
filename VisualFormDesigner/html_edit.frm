object frmHTMLedit: TfrmHTMLedit
  Left = 358
  Height = 399
  Top = 256
  Width = 668
  ActiveControl = Memo1
  Caption = 'Label HTML editor'
  ClientHeight = 399
  ClientWidth = 668
  LCLVersion = '7.9'
  object Panel1: TPanel
    Left = 0
    Height = 47
    Top = 352
    Width = 668
    Align = alBottom
    ClientHeight = 47
    ClientWidth = 668
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 540
      Height = 30
      Top = 10
      Width = 75
      Default = True
      DefaultCaption = True
      Kind = bkOK
      ModalResult = 1
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 424
      Height = 30
      Top = 10
      Width = 75
      DefaultCaption = True
      Kind = bkAbort
      ModalResult = 3
      TabOrder = 1
    end
  end
  object Memo1: TMemo
    Left = 0
    Height = 352
    Top = 0
    Width = 668
    Align = alClient
    Lines.Strings = (
      'enter HTML text here'
    )
    TabOrder = 1
  end
end
