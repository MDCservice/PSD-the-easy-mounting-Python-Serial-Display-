unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, CalendarLite, TAGraph, IpHtml, AdvLed, Forms,
  Controls, Graphics, Dialogs, ComCtrls, Menus, StdCtrls, ExtCtrls, ValEdit,
  ELDsgxSurface, ELDsgxUtils, ELDsgxImp, ELDsgxObjectInsp,
  TplCircleProgressUnit, TplA3nalogGaugeUnit, TplGnouMeterUnit, HRingPicker,
  HSLColorPicker, mbColorList, ubarcodes, cyLabel, JLabel, JvHtControls,
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
      iTest: integer;
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

  { TMainForm }

  TMainForm = class(TForm)
    Active1: TMenuItem;
    AdvLed1: TAdvLed;
    ButtonButton: TToolButton;
    Chart1: TChart;
    csDesigning1: TMenuItem;
    DelphiSelector1: TMenuItem;
    File1: TMenuItem;
    Grid1: TMenuItem;
    ImageButton: TToolButton;
    ImageButton1: TToolButton;
    ArcButton1: TToolButton;
    ImageButton2: TToolButton;
    ImageButton3: TToolButton;
    ImageButton4: TToolButton;
    ImageButton5: TToolButton;
    ImageButton6: TToolButton;
    ImageButton7: TToolButton;
    ImageButton8: TToolButton;
    ImageButton9: TToolButton;
    IpHtmlPanel1: TIpHtmlPanel;
    JvHTLabel1: TJvHTLabel;
    PaletteButton: TToolButton;
    ImageList1: TImageList;
    JvDesignPanel: TplDesignPanel;
    LabelButton: TToolButton;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    miSize: TMenuItem;
    miScreen: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    OpenDialog: TOpenDialog;
    PageControl1: TPageControl;
    PaletteButton1: TToolButton;
    PaletteButton2: TToolButton;
    PaletteButton3: TToolButton;
    PaletteButton4: TToolButton;
    PaletteButton5: TToolButton;
    plA3nalogGauge1: TplA3nalogGauge;
    plGnouMeter1: TplGnouMeter;
    plObjectInspector1: TplObjectInspector;
    ProgressBar1: TProgressBar;
    Rules1: TMenuItem;
    Save1: TMenuItem;
    SaveDialog: TSaveDialog;
    SelectButton: TToolButton;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ToolBar1: TToolBar;
    VSSelector1: TMenuItem;
    WindowProcHook1: TMenuItem;
    procedure Active1Click(Sender: TObject);
    procedure csDesigning1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Grid1Click(Sender: TObject);
    procedure IpHtmlPanel1Click(Sender: TObject);
    procedure PaletteButtonMouseEnter(Sender: TObject);
    procedure PaletteButtonMouseLeave(Sender: TObject);
    procedure JvDesignPanelSelectionChange(Sender: TObject);
    procedure miSizeClick(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure plObjectInspector1AddAvailPersistent(APersistent: TPersistent;
      var Allowed: boolean);
    procedure Rules1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure JvDesignPanelGetAddClass(Sender: TObject; var ioClass: String);
    procedure JvDesignPanelPaint(Sender: TObject);
    procedure PaletteButtonClick(Sender: TObject);
    procedure TabSheet3EndDrag(Sender, Target: TObject; X, Y: Integer);


  private
    { private declarations }
    screen_with: integer;
    screen_height: integer;
    isLandscape: boolean;
    compoList: TStringList;

  public
    { public declarations }
    DesignClass: string;
    StickyClass: Boolean;

  end; 

var
  MainForm: TMainForm;

implementation
uses screenprops, toolwin, html_edit;

{$R *.frm}

{ TMainForm }

procedure TMainForm.New1Click(Sender: TObject);
begin
    JvDesignPanel.Clear;
end;

procedure TMainForm.Grid1Click(Sender: TObject);
begin

end;

procedure TMainForm.IpHtmlPanel1Click(Sender: TObject);
begin

end;

procedure TMainForm.PaletteButtonMouseEnter(Sender: TObject);
begin
     //PaletteButton.ShowHint:=true;
    if (Sender is TControl) then
     Statusbar1.Panels[1].text := (sender as TControl).Hint;
end;

procedure TMainForm.PaletteButtonMouseLeave(Sender: TObject);
begin
     //PaletteButton.ShowHint:=false;
     Statusbar1.Panels[1].text := '';
end;



procedure TMainForm.JvDesignPanelSelectionChange(Sender: TObject);
var aa: TplDesignObjectArray;
begin
     //Statusbar1.Panels[1].text := sender.className;
     aa := JvDesignPanel.Surface.Selected;
     if length(aa) > 0 then begin
        if ( aa[0] is TPersistent) then
           plObjectInspector1.Selected := TPersistent(aa[0]);
     end;

end;

procedure TMainForm.miSizeClick(Sender: TObject);
begin
     //frmScreenProps.ShowModal;
     JvDesignPanel.Active := false;
     try
       frmScreenProps := TfrmScreenProps.Create(application);
       frmScreenProps.showModal;
       screen_with := frmScreenProps.seScreenWidth.value;
       screen_height := frmScreenProps.seScreenHight.value;
       JvDesignPanel.Height:=screen_height;
       JvDesignPanel.Width:=screen_with;
       if frmScreenProps.rgScreenOrient.ItemIndex = 0 then
         isLandscape := true
       else isLandscape := false;
       frmScreenProps.Free;
     finally
       JvDesignPanel.Active := true;
     end;
end;

procedure TMainForm.csDesigning1Click(Sender: TObject);
begin
    JvDesignPanel.Active := false;
  if WindowProcHook1.Checked then
    JvDesignPanel.Surface.MessengerClass := TplDesignWinControlHookMessenger
  else
    JvDesignPanel.Surface.MessengerClass := TplDesignDesignerMessenger;
  JvDesignPanel.Active := true;
  JvDesignPanel.Invalidate;

end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
       PageControl1.ActivePage := TabSheet1;
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     JvDesignPanel.Active := false;
     compoList.free;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
     OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
     SaveDialog.InitialDir := OpenDialog.InitialDir;
     JvDesignPanel.Surface.Active := true;
     compoList := TStringList.create(true);
     compoList.Add('');
     compoList.Add('TlvArc');
     compoList.Add('TlvAnimimg');
     compoList.Add('TlvBar');
     compoList.Add('TlvButton');
     compoList.Add('TlvBtnMatrix');
     compoList.Add('TlvCalendar');
     compoList.Add('TlvColorWheel');
     compoList.Add('TlvCanvas');
     compoList.Add('TlvCheckbox');
     compoList.Add('TlvImage');
     compoList.Add('TlvLabel');
     compoList.Add('TlvPanel');
     compoList.Add('TlvChart');
     compoList.Add('TlvContainer');
     compoList.Add('TlvColorPicker');
     compoList.Add('TlvDropDown');
     compoList.Add('TlvGauge');
     compoList.Add('TlvImageButton');
     compoList.Add('TlvKeyboard');
     compoList.Add('TlvLabel');
     compoList.Add('TlvLED');

     compoList.Add('TlvMemo');

end;

procedure TMainForm.Active1Click(Sender: TObject);
begin
    JvDesignPanel.Active := Active1.Checked;
  JvDesignPanel.Invalidate;

end;

procedure TMainForm.Open1Click(Sender: TObject);
begin
    if OpenDialog.Execute then
    JvDesignPanel.LoadFromFile(OpenDialog.Filename);

end;

procedure TMainForm.plObjectInspector1AddAvailPersistent(
  APersistent: TPersistent; var Allowed: boolean);
begin

end;

procedure TMainForm.Rules1Click(Sender: TObject);
begin
    if Rules1.Checked then begin
    JvDesignPanel.Color := clWhite;
    JvDesignPanel.DrawRules := true;
    JvDesignPanel.OnPaint := nil;
  end else begin
    JvDesignPanel.Color := clBtnFace;
    JvDesignPanel.DrawRules := false;
    JvDesignPanel.OnPaint := @JvDesignPanelPaint;
  end;
  JvDesignPanel.Invalidate;

end;

procedure TMainForm.Save1Click(Sender: TObject);
begin
    if SaveDialog.Execute then
    JvDesignPanel.SaveToFile(SaveDialog.Filename);

end;

procedure TMainForm.JvDesignPanelGetAddClass(Sender: TObject; var ioClass: String);
var userCodeBeginLine, userCodeEndLine: integer;
    classFound: boolean;

begin
{

}
     Statusbar1.Panels[0].text := 'DesignClass = '+DesignClass;
     classFound := false;
     ioClass := DesignClass;
     if not StickyClass then begin
       DesignClass := '';
       SelectButton.Down  := true;
     end;
     userCodeBeginLine := memo1.Lines.IndexOf('# widgets begin here - do not remove this line');
     userCodeEndLine   := memo1.Lines.IndexOf('# widgets end here  - do not remove this line');
     if (userCodeEndLine > 0) then begin
       case ioClass of
           'TlvButton': begin
                        memo1.Lines.insert(userCodeEndLine-1, 'btn = lv.btn(scr)  ');
                        memo1.Lines.insert(userCodeEndLine, 'btn.align(lv.ALIGN.CENTER, 0, 0) ');
                        classFound := true;
                      end;
           'TlvPanel': begin
                        memo1.Lines.insert(userCodeEndLine-1, 'Panel');
                        classFound := true;
                     end;
           'TlvImage': begin
                        memo1.Lines.insert(userCodeEndLine-1, 'Image');
                        classFound := true;
                     end;
           'TlvColorWheel': begin


                    end;
           'TlvColorPicker': begin

                    end;
           'TlvDropDown': begin

                          end;
           'TlvGauge': begin

                       end;
           'TlvImageButton': begin

                             end;
           'TlvKeyboard': begin

                          end;
           'TlvLabel': begin

                       end;
           'TlvLED': begin

                     end;
       end; // case
     end else begin
               if trim(ioClass) <> '' then
                  memo1.Lines.add(' unknown ioClass: '+ioClass);

     end;
     if classFound = false then
        Statusbar1.Panels[0].text := Statusbar1.SimpleText+' CLASS NOT FOUND';

end;

procedure TMainForm.JvDesignPanelPaint(Sender: TObject);
begin
  with JvDesignPanel do
     DesignPaintGrid(Canvas, ClientRect, Color);

end;

procedure TMainForm.PaletteButtonClick(Sender: TObject);
//const
  //cClasses: array[0..12] of string = ( '', 'TlvArc', 'TlvAnimimg', 'TlvBar', 'TlvButton',
  //  'TlvBtnMatrix', 'TlvCalendar', 'TlvColorWheel', 'TlvCanvas', 'TlvCheckbox', 'TlvImage', 'TlvLabel', 'TlvPanel');

var tc: TControl;
begin
     // StickyClass := (GetKeyState(VK_SHIFT) < 0);
     StickyClass := False;
     tc := TControl(Sender);
     if (tc is TToolButton) then begin
        DesignClass := 'Tlv'+(tc as TToolButton).hint;
     end else
        DesignClass := '';

end;

procedure TMainForm.TabSheet3EndDrag(Sender, Target: TObject; X, Y: Integer);
begin

end;

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
     MainForm.JvDesignPanel.Active:=false;
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
     end;
end;

procedure TlvLabel.SetHTML(const Value: TStrings);
begin
     MainForm.JvDesignPanel.Active:=false;
     self.fHTML.Text:= Value.Text;
     MainForm.JvDesignPanel.Active:=true;
end;

constructor TlvLED.Create(AOwner: TComponent);
begin
     inherited create(aOwner);
     self.Shape := stCircle;
     self.Brush.Color := clRed;
     self.Width:=30;
     self.Height:=30;
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

