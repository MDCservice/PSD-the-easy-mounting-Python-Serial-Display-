object frmScreenProps: TfrmScreenProps
  Left = 358
  Height = 240
  Top = 227
  Width = 320
  Caption = 'Screen properties'
  ClientHeight = 240
  ClientWidth = 320
  LCLVersion = '7.9'
  object Label1: TLabel
    Left = 33
    Height = 17
    Top = 33
    Width = 72
    Caption = 'Screen width'
  end
  object seScreenWidth: TSpinEdit
    Left = 126
    Height = 27
    Top = 28
    Width = 114
    TabOrder = 0
    Value = 600
  end
  object Label2: TLabel
    Left = 33
    Height = 17
    Top = 80
    Width = 72
    Caption = 'Screen width'
  end
  object seScreenHight: TSpinEdit
    Left = 126
    Height = 27
    Top = 72
    Width = 114
    TabOrder = 1
    Value = 480
  end
  object BitBtn1: TBitBtn
    Left = 205
    Height = 30
    Top = 194
    Width = 75
    Default = True
    DefaultCaption = True
    Kind = bkOK
    ModalResult = 1
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 48
    Height = 30
    Top = 194
    Width = 75
    DefaultCaption = True
    Kind = bkAbort
    ModalResult = 3
    TabOrder = 3
  end
  object rgScreenOrient: TRadioGroup
    Left = 40
    Height = 45
    Top = 125
    Width = 218
    AutoFill = True
    Caption = 'Screen Orientation'
    ChildSizing.LeftRightSpacing = 6
    ChildSizing.EnlargeHorizontal = crsHomogenousChildResize
    ChildSizing.EnlargeVertical = crsHomogenousChildResize
    ChildSizing.ShrinkHorizontal = crsScaleChilds
    ChildSizing.ShrinkVertical = crsScaleChilds
    ChildSizing.Layout = cclTopToBottomThenLeftToRight
    ChildSizing.ControlsPerLine = 1
    ClientHeight = 26
    ClientWidth = 214
    ColumnLayout = clVerticalThenHorizontal
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'landscape'
      'portrait'
    )
    TabOrder = 4
  end
end
