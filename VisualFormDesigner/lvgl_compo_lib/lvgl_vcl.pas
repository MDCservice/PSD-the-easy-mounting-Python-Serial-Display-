unit lvgl_vcl;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, CalendarLite, TAGraph, IpHtml,  Forms,
  Controls, Graphics, Dialogs, ComCtrls, Menus, StdCtrls, ExtCtrls, ValEdit,
//  AdvLed,, ELDsgxSurface, ELDsgxUtils, ELDsgxImp, ELDsgxObjectInsp,
  TplCircleProgressUnit, TplA3nalogGaugeUnit, TplGnouMeterUnit, HRingPicker,
  HSLColorPicker, mbColorList, cyLabel, JLabel, JvHtControls,
  ButtonPanel, Buttons;

type

  TlvArc = class(TplCircleProgress)

  end;
  TlvAnimimg =class(TImage)

  end;

  TlvBar = class(TProgressBar)

  end;

  TlvButton = class(TCustomButton)

  end;

  TlvPanel = class(TPanel)

  end;

  TlvImage = class(TImage)

  end;

  TlvBtnMatrix = class(TCustomButtonPanel)

  end;

  TlvCalendar = class(TCalendarLite)

  end;

  TlvColorWheel = class(THRingPicker)
    public
      constructor create(aOwner: TWinControl); overload;
  end;

  TlvCanvas = class(TPaintbox)

  end;

  TlvCheckbox = class(TCheckbox)

  end;

  TlvChart = class(TChart)

  end;

  TlvContainer = class(TCustomPanel)

  end;

  TlvColorPicker = class(TmbColorList)

  end;

  TlvDropDown = class(TcustomComboBox)

  end;

  TlvGauge = class(TplA3nalogGauge)

  end;

  TlvImageButton = class(TSpeedButton)

  end;

  TlvKeyboard = class(TCustomPanel)
    private
      fBtnRow1, fBtnRow2, fBtnRow3, fBtnRow4: TToolbar;
      fBtn1hash: TSpeedButton;
      fBtnQ, fBtnW, fBtnE, fBtnR, fBtnT, fBtnY, fBtnU, fBtnI, fBtnO, fBtnP, fBtnBack: TSpeedButton;
      fBtnABC: TSpeedButton;
      fBtnA, fBtnS, fBtnD, fBtnF, fBtnG, fBtnH, fBtnJ, fBtnK, fBtnL, fBtnReturn: TSpeedButton;
      fBtnUscore, fBtnMinus, fBtnZ, fBtnX, fBtnC, fBtnV, fBtnB, fBtnN, fBtnM, fBtnPunkt, fBtnKomma, fBtnDoppelpunkt: TSpeedButton;
      fBtnAbort, fBtnLeft, fBtnRight, fBtnOK: TSpeedButton;
    public
     constructor Create(AOwner: TComponent); override;
     destructor Destroy; override;

  end;

  TlvLabel = class(TIpHTMLPanel)
  private
    fHTML: TStrings;
    procedure fOnDblClickHTMLLabel(Sender: TObject);
    procedure SetHTML(const Value: TStrings);
  public
   constructor Create(AOwner: TComponent); override;
   destructor Destroy; override;
  published
    property HTML: TStrings read fHTML write SetHTML;

  end;

  TlvMemo = class(TMemo)

  end;

  TlvLED = class(TShape)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  function createCompInstance(pcClassName: PChar; aOwner, aParent: pointer): TComponent; cdecl;
  procedure demo(iInt: integer); cdecl;

var global_i: integer; //for test only

implementation
uses toolwin;

constructor TlvColorWheel.create(aOwner: TWinControl);
begin
     inherited create(aOwner);
     self.Width := 100;
     self.Height := 100;
     self.Radius := 35;
     self.Resize;
end;

function AddButtonToToolbar(var bar: TToolBar; caption: string): TSpeedButton;
var
  newbtn: TSpeedButton;
  lastbtnidx: integer;
begin
  newbtn := TSpeedButton.Create(bar);  //TToolButton.Create(bar);
  newbtn.Caption := caption;
  //newbtn.Width := bar.Width div 12; //12 Buttons in erster Reihe
  //newbtn.Height := newbtn.Width;
  newbtn.Height := 25;
  newbtn.Width := newbtn.Height;
  lastbtnidx := bar.ButtonCount - 1;
  if lastbtnidx > -1 then
    newbtn.Left := bar.Buttons[lastbtnidx].Left + bar.Buttons[lastbtnidx].Width
  else
    newbtn.Left := 0;
  newbtn.Parent := bar;
  result := newbtn;
end;

constructor TlvKeyboard.Create(AOwner: TComponent);
begin
     inherited create(AOwner);

     self.width := (12 * 25)+20;
     self.height := (4 * 25)+13;

     fBtnRow4 := TToolbar.Create(self);
     fBtnRow4.Height:=29;
     fBtnRow4.ShowCaptions := true;
     fBtnRow4.EdgeInner := esNone;
     fBtnRow4.EdgeOuter := esNone;
     fBtnAbort := AddButtonToToolbar( fBtnRow4, 'X');
     fBtnLeft := AddButtonToToolbar( fBtnRow4, '<');
     fBtnRight := AddButtonToToolbar( fBtnRow4, '>');
     fBtnOK := AddButtonToToolbar( fBtnRow4, 'OK');

     fBtnAbort.Width := (fBtnAbort.Width*3)-4;
     fBtnLeft.Width := (fBtnLeft.Width*3)-4;
     fBtnRight.Width := (fBtnRight.Width*3)-4;
     fBtnOK.Width := (fBtnOK.Width*3)-4;

     fBtnRow4.Flat := false;
     fBtnRow4.Parent := self;

      fBtnRow3 := TToolbar.Create(self);
      fBtnRow3.EdgeInner := esNone;
      fBtnRow3.EdgeOuter := esNone;
      fBtnRow3.ShowCaptions := true;
      fBtnUscore := AddButtonToToolbar(fBtnRow3, '_');
      fBtnMinus := AddButtonToToolbar(fBtnRow3, '-');
      fBtnZ := AddButtonToToolbar(fBtnRow3, 'z');
      fBtnX := AddButtonToToolbar(fBtnRow3, 'x');
      fBtnC := AddButtonToToolbar(fBtnRow3, 'c');
      fBtnV := AddButtonToToolbar(fBtnRow3, 'v');
      fBtnB := AddButtonToToolbar(fBtnRow3, 'b');
      fBtnN := AddButtonToToolbar(fBtnRow3, 'n');
      fBtnM := AddButtonToToolbar(fBtnRow3, 'm');
      fBtnPunkt := AddButtonToToolbar(fBtnRow3, '.');
      fBtnKomma := AddButtonToToolbar(fBtnRow3, ',');
      fBtnDoppelpunkt := AddButtonToToolbar(fBtnRow3, ':');
      fBtnRow3.Flat := false;
      fBtnRow3.Parent := self;


     fBtnRow2 := TToolbar.Create(self);
     fBtnRow2.ShowCaptions := true;
     fBtnRow2.EdgeInner := esNone;
     fBtnRow2.EdgeOuter := esNone;
//     with TToolButton.Create(fBtnRow2) do begin
//          Style := tbsSeparator;
//          width := 12;
//          Left := 1;
//          Down := true;
//          Parent := fBtnRow2;
//     end;
     fBtnABC := AddButtonToToolbar(fBtnRow2, 'ABC');
     fBtnABC.width := round(fBtnABC.width*1.5);
     fBtnA := AddButtonToToolbar(fBtnRow2, 'a');
     fBtnS := AddButtonToToolbar(fBtnRow2, 's');
     fBtnD := AddButtonToToolbar(fBtnRow2, 'd');
     fBtnF := AddButtonToToolbar(fBtnRow2, 'f');
     fBtnG := AddButtonToToolbar(fBtnRow2, 'g');
     fBtnH := AddButtonToToolbar(fBtnRow2, 'h');
     fBtnJ := AddButtonToToolbar(fBtnRow2, 'j');
     fBtnK := AddButtonToToolbar(fBtnRow2, 'k');
     fBtnL := AddButtonToToolbar(fBtnRow2, 'l');
     fBtnReturn := AddButtonToToolbar(fBtnRow2, '<-');
     fBtnRow2.Flat := false;
     fBtnRow2.Parent := self;

     fBtnRow1 := TToolbar.Create(self);
     fBtnRow1.ShowCaptions := true;
     fBtnRow1.EdgeInner := esNone;
     fBtnRow1.EdgeOuter := esNone;

     fBtn1hash := AddButtonToToolbar(fBtnRow1, '1#');

     fBtnQ := AddButtonToToolbar(fBtnRow1, 'q');
     fBtnW := AddButtonToToolbar(fBtnRow1, 'w');
     fBtnE := AddButtonToToolbar(fBtnRow1, 'e');
     fBtnR := AddButtonToToolbar(fBtnRow1, 'r');
     fBtnT := AddButtonToToolbar(fBtnRow1, 't');
     fBtnY := AddButtonToToolbar(fBtnRow1, 'y');
     fBtnU := AddButtonToToolbar(fBtnRow1, 'u');
     fBtnI := AddButtonToToolbar(fBtnRow1, 'u');
     fBtnO := AddButtonToToolbar(fBtnRow1, 'o');
     fBtnP := AddButtonToToolbar(fBtnRow1, 'p');
     fBtnBack := AddButtonToToolbar(fBtnRow1, '<x');
     fBtnRow1.Flat := false;
     fBtnRow1.Parent := self;


end;

destructor TlvKeyboard.Destroy;
begin
     fBtn1hash.free;
     fBtnQ.free; fBtnW.free; fBtnE.free; fBtnR.free; fBtnT.free; fBtnY.free; fBtnU.free; fBtnI.free; fBtnO.free; fBtnP.free; fBtnBack.free;
     fBtnABC.free;
     fBtnA.free; fBtnS.free; fBtnD.free; fBtnF.free; fBtnG.free; fBtnH.free; fBtnJ.free; fBtnK.free; fBtnL.free; fBtnReturn.free;
     fBtnUscore.free; fBtnMinus.free; fBtnZ.free; fBtnX.free; fBtnC.free; fBtnV.free; fBtnB.free; fBtnN.free; fBtnM.free; fBtnPunkt.free; fBtnKomma.free; fBtnDoppelpunkt.free;
     fBtnAbort.free; fBtnLeft.free; fBtnRight.free; fBtnOK.free;
     fBtnRow1.free;
     fBtnRow2.free;
     fBtnRow3.free;
     fBtnRow4.free;

     inherited destroy;
end;

constructor TlvLabel.Create(AOwner: TComponent);
const
  cHtml = '<html>' +
           '<h2>New features</h2>'+
           '<ul>'+
             '<li>click right mouse to edit</li>'+
             '<li>New item 2</li>'+
             '<li>New item 3</li>'+
           '</ul>'+
//           '<h2>Important changes</h2>'+
//           '<ul>'+
//             '<li>Item 1</li>'+
//             '<li>Item 2</li>'+
//           '</ul>'+
         '</html>';
begin
     inherited Create(AOwner);
     self.SetHtmlFromStr(cHtml);
     self.OnClick := @fOnDblClickHTMLLabel;
     fHTML := TStringList.Create(true);
end;

destructor TlvLabel.Destroy;
begin
     fHTML.free;
     inherited Destroy;
end;

procedure TlvLabel.fOnDblClickHTMLLabel(Sender: TObject);
var newHtml: string;
begin
    { MainForm.JvDesignPanel.Active:=false;
     newHtml := '<html>' + chr(13)+chr(10)+
              '<h2>New features</h2>'+chr(13)+chr(10)+
              '<ul>'+chr(13)+chr(10)+
                '<li>click right mouse to edit</li>'+chr(13)+chr(10)+
                '<li>New item 2</li>'+chr(13)+chr(10)+
                '<li>New item 3</li>'+chr(13)+chr(10)+
              '</ul>'+chr(13)+chr(10)+
            '</html>';

     frmHTMLedit := TfrmHTMLedit.Create(MainForm);
     try
       frmHTMLedit.Memo1.Lines.Text := newHtml;
       if frmHTMLedit.ShowModal = mrOK then
          self.SetHtmlFromStr( frmHTMLedit.Memo1.Lines.Text );
     finally
       frmHTMLedit.free;
       frmHTMLedit := nil;
       MainForm.JvDesignPanel.Active:=true;
     end;  }
end;

procedure TlvLabel.SetHTML(const Value: TStrings);
begin
     //MainForm.JvDesignPanel.Active:=false;
     self.fHTML.Text:= Value.Text;
     //MainForm.JvDesignPanel.Active:=true;
end;

constructor TlvLED.Create(AOwner: TComponent);
begin
     inherited create(aOwner);
     self.Shape := stCircle;
     self.Brush.Color := clRed;
     self.Width:=30;
     self.Height:=30;
end;

procedure demo(iInt: integer); cdecl;
begin
     global_i := iInt;
end;

function createCompInstance(pcClassName: PChar; aOwner, aParent: pointer): TComponent; cdecl;
var sClassName: string;
    retPInt: TControl;
begin
     retPInt := nil;
     try
       sClassName := string(pcClassName);
       showMessage('Erzeuge jetzt ein '+sClassName);
       case sClassName of
         'TlvArc': retPInt := TlvArc.Create( TControl(aOwner)  );
         'TlvAnimimg': retPInt := TlvAnimimg.Create( TControl(aOwner)  );
         'TlvBar': retPInt := TlvBar.Create( TControl(aOwner)  );
         'TlvButton': retPInt := TlvButton.Create( TControl(aOwner)  );
         'TlvPanel': retPInt := TlvPanel.Create( TControl(aOwner)  );
         'TlvImage': retPInt := TlvImage.Create( TControl(aOwner)  );
         'TlvBtnMatrix': retPInt := TlvBtnMatrix.Create( TControl(aOwner)  );
         'TlvCalendar': retPInt := TlvCalendar.Create( TComponent(aOwner)  );
         'TlvColorWheel': retPInt := TlvColorWheel.Create( TControl(aOwner)  );
         'TlvCanvas': retPInt := TlvCanvas.Create( TControl(aOwner)  );
         'TlvCheckbox': retPInt := TlvCheckbox.Create( TControl(aOwner)  );
         'TlvChart': retPInt := TlvChart.Create( TControl(aOwner)  );
         'TlvContainer': retPInt := TlvContainer.Create( TControl(aOwner)  );
         'TlvColorPicker': retPInt := TlvColorPicker.Create( TControl(aOwner)  );
         'TlvDropDown': retPInt := TlvDropDown.Create( TControl(aOwner)  );
         'TlvGauge': retPInt := TlvGauge.Create( TControl(aOwner)  );
         'TlvImageButton': retPInt := TlvImageButton.Create( TControl(aOwner)  );
         'TlvKeyboard': retPInt := TlvKeyboard.Create( TControl(aOwner)  );
         'TlvLabel': retPInt := TlvLabel.Create( TControl(aOwner)  );
         'TlvMemo': retPInt := TlvMemo.Create( TControl(aOwner)  );
         'TlvLED': retPInt := TlvLED.Create( TControl(aOwner)  );
         else retPInt := nil;
       end;

       if (retPInt <> nil) then begin
          retPInt.Parent := TWinControl(aParent);
       end;
     except
       on E: Exception do
           ShowMessage( 'Error: '+ E.ClassName + #13#10 + E.Message );
     end;
     result := retPInt;
end;




initialization
  RegisterClass(TlvArc);
  RegisterClass(TlvAnimimg);
  RegisterClass(TlvBar);
  RegisterClass(TlvButton);
  RegisterClass(TlvLabel);
  RegisterClass(TlvPanel);
  RegisterClass(TlvImage);
  RegisterClass(TlvBtnMatrix);
  RegisterClass(TlvCalendar);
  RegisterClass(TlvColorWheel);
  RegisterClass(TlvCanvas);
  RegisterClass(TlvCheckbox);
  RegisterClass(TlvChart);
  RegisterClass(TlvContainer);
  RegisterClass(TlvDropDown);
  RegisterClass(TlvGauge);
  RegisterClass(TlvImageButton);
  RegisterClass(TlvKeyboard);
  RegisterClass(TlvLabel);
  RegisterClass(TlvLED);

  RegisterClass(TlvMemo);


end.



