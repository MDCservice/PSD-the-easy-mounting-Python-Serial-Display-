unit HTML_edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  StdCtrls;

type

  { TfrmHTMLedit }

  TfrmHTMLedit = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Memo1: TMemo;
    Panel1: TPanel;
  private

  public

  end;

var
  frmHTMLedit: TfrmHTMLedit;

implementation

{$R *.frm}

end.

