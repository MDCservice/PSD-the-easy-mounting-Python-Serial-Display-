unit screenprops;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,
  Buttons, ExtCtrls;

type

  { TfrmScreenProps }

  TfrmScreenProps = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    rgScreenOrient: TRadioGroup;
    seScreenHight: TSpinEdit;
    seScreenWidth: TSpinEdit;
  private

  public

  end;

var
  frmScreenProps: TfrmScreenProps;

implementation

{$R *.frm}

end.

