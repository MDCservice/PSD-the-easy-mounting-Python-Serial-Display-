unit form_ide_main;

{$mode objfpc}{$H+}
{$M+} //RTTI properties
interface

uses
  Classes, SysUtils, FileUtil, ELDsgxSurface, mscoreengine, ExtendedNotebook,
  LResources, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, Menus,
  ActnList, ComCtrls, ValEdit, Arrow, Buttons, PythonEngine,
  PythonGUIInputOutput,
//  TitanScripterBaseEngine,
  //....Registration Units...........

//  allregsystem,

  //....Registration Units...........

  SynEdit, SynHighlighterPas, SynHighlighterPython, SynHighlighterCpp, dynlibs;

type

    //TSubStrFunc = function(const CString:PChar;FromPos,ToPos: longint):PChar;cdecl;
    //function createCompInstance(pcClassName: PChar; aOwner, aParent: pointer): TComponent; cdecl;
    //TCreateCompInstance = function(const pcClassName: PChar; aOwner, aParent: pointer): TComponent; cdecl;

  { TfrmIDEmain }

  TfrmIDEmain = class(TForm)
    actExit: TAction;
    actNew: TAction;
    actStop: TAction;
    actRun: TAction;
    actSaveAs: TAction;
    actSave: TAction;
    actOpen: TAction;
    ActionList1: TActionList;
    ArcButton1: TToolButton;
    Button1: TButton;
    ButtonButton: TToolButton;
    ExtendedNotebook1: TExtendedNotebook;
    ImageButton: TToolButton;
    ImageButton1: TToolButton;
    ImageButton10: TToolButton;
    ImageButton11: TToolButton;
    ImageButton12: TToolButton;
    ImageButton13: TToolButton;
    ImageButton14: TToolButton;
    ImageButton2: TToolButton;
    ImageButton3: TToolButton;
    ImageButton4: TToolButton;
    ImageButton5: TToolButton;
    ImageButton6: TToolButton;
    ImageButton7: TToolButton;
    ImageButton8: TToolButton;
    ImageButton9: TToolButton;
    ImageListIDE: TImageList;
    ImageListComponents: TImageList;
    JvDesignPanel: TplDesignPanel;
    LabelButton: TToolButton;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    mnuEdit: TMenuItem;
    mnuFileNew: TMenuItem;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    PaletteButton: TToolButton;
    PaletteButton1: TToolButton;
    PaletteButton2: TToolButton;
    PaletteButton3: TToolButton;
    PaletteButton4: TToolButton;
    PaletteButton5: TToolButton;
    Panel1: TPanel;
    Panel2: TPanel;
    PanelLeft: TPanel;
    PythonEngine1: TPythonEngine;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    PythonInputOutput1: TPythonInputOutput;
    SaveDialog1: TSaveDialog;
    ScrollBox1: TScrollBox;
    SelectButton: TToolButton;
    SpeedButton1: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    StatusBar1: TStatusBar;
    SynCppSyn1: TSynCppSyn;
    SynEdit1: TSynEdit;
    SynPasSyn1: TSynPasSyn;
    SynPythonSyn1: TSynPythonSyn;
    TabSheet1: TTabSheet;
    ToolButton9: TToolButton;
    tsGUI: TTabSheet;
    tsEdit: TTabSheet;
    tsForm1: TTabSheet;
    ToolBar2: TToolBar;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    tsEvents: TTabSheet;
    tsProperties: TTabSheet;
    propertEditor: TValueListEditor;
    ValueListEditor2: TValueListEditor;
    procedure actExitExecute(Sender: TObject);
    procedure actNewExecute(Sender: TObject);
    procedure actOpenExecute(Sender: TObject);
    procedure actRunExecute(Sender: TObject);
    procedure actSaveAsExecute(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actStopExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure JvDesignPanelGetAddClass(Sender: TObject; var ioClass: string);
    procedure JvDesignPanelSelectionChange(Sender: TObject);
    procedure mscrPascalScript1RunLine(aSender: TmscrScript; const aUnitName,
      aSrcPosition: String);
    procedure PaletteButtonClick(Sender: TObject);
    procedure PaletteButtonMouseEnter(Sender: TObject);
    procedure PaletteButtonMouseLeave(Sender: TObject);
    procedure PythonEngine1AfterLoad(Sender: TObject);
    procedure ScrollBox1Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private
    fFilename:string;
    //procedure DoOnError(Sender : TObject; Const aErrorType:integer);
    //procedure PropertyNames2Grid(C : TComponent);
  public
    { public declarations }
    DesignClass: string;
    StickyClass: Boolean;
  end; 

const
      liblvgl_base_name = 'liblvgl_base_lib.';
{$ifdef windows}
  libext = 'dll';
{$else}
{$ifdef macos}
  libext = 'dylib';
{$else}
    libext = 'so';
{$endif}
{$endif}

var
  frmIDEmain: TfrmIDEmain;
  //lib: TLibHandle;
  //CreateCompInstance: TCreateCompInstance;

implementation
uses lvgl_vcl;
//uses typinfo, rtti;

{$R *.frm}

//-------------------------------------------------- 9999
const
// CodeTyphon: Different platforms store resource files on different locations
{$IFDEF Windows}
  pathMedia = '..\testscripts\';
{$ENDIF}
{$IFDEF UNIX}
  pathMedia = '../testscripts/';
{$ENDIF}
//--------------------------------------------------

procedure TfrmIDEmain.actExitExecute(Sender: TObject);
begin
  close;
end;

procedure TfrmIDEmain.actNewExecute(Sender: TObject);
begin
     JvDesignPanel.Clear;
end;

procedure TfrmIDEmain.actOpenExecute(Sender: TObject);
begin
   if fFilename='' then
    OpenDialog1.InitialDir:=pathMedia else
    OpenDialog1.FileName:=fFilename;

  if OpenDialog1.Execute then
   begin
    SynEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
    fFilename:=OpenDialog1.FileName;
    StatusBar1.SimpleText:=fFilename;
   end;
end;

procedure TfrmIDEmain.actSaveAsExecute(Sender: TObject);
begin
  if fFilename='' then
   SaveDialog1.InitialDir:=pathMedia;
   SaveDialog1.FileName:=OpenDialog1.FileName;
   if SaveDialog1.Execute then
   begin
    SynEdit1.Lines.SaveToFile(SaveDialog1.FileName);
    fFilename:=OpenDialog1.FileName;
    StatusBar1.SimpleText:=fFilename;
   end;
end;

procedure TfrmIDEmain.actSaveExecute(Sender: TObject);
begin
   if fFilename='' then
   actSaveAsExecute(nil) else
   SynEdit1.Lines.SaveToFile(fFileName);
   StatusBar1.SimpleText:=fFilename;
end;

procedure TfrmIDEmain.actRunExecute(Sender: TObject);
begin
   SynEdit1.Clear;

end;

procedure TfrmIDEmain.actStopExecute(Sender: TObject);
begin
     //BaseScriptEngine1.Stop;
end;

procedure TfrmIDEmain.FormActivate(Sender: TObject);
begin
     JvDesignPanel.Active := true;
end;

procedure TfrmIDEmain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     JvDesignPanel.Active := false;
end;

procedure TfrmIDEmain.FormCreate(Sender: TObject);
//var sLibname: string;
begin
 {
     sLibname := GetCurrentDir;
     sLibname := sLibname+DirectorySeparator+liblvgl_base_name+libext;
     CreateCompInstance := nil;
     if FileExists(sLibname) then begin
        lib := 0;
        lib:=LoadLibrary(sLibname);
        if (lib = 0) then showMessage('LoadLibrary '+sLibName+' failed');
        Pointer(CreateCompInstance):=GetProcAddress(lib,'createCompInstance');
        if (CreateCompInstance = nil) then showMessage('LoadLibrary: Function CreateCompInstance not found');
     end else
       showMessage('Library '+sLibName+' not found');
 }
end;

procedure TfrmIDEmain.JvDesignPanelGetAddClass(Sender: TObject; var ioClass: string);
var userCodeBeginLine, userCodeEndLine: integer;
    classFound: boolean;
    ts, editorTS: TTabSheet;
    ten: TExtendedNoteBook;
    i, xi: integer;
    aWC: TWinControl;
    theSynEdit: TSynEdit;
begin
   theSynEdit := nil;
   Statusbar1.Panels[0].text := 'DesignClass = '+DesignClass;
   if (sender is TplDesignSurface) then begin
      if ((sender as TplDesignSurface).Container is TplDesignPanel) then begin
         aWC := ((sender as TplDesignSurface).Container as TplDesignPanel).Parent;
         if (aWC is TTabSheet) then begin
           ts := (aWC as TTabSheet);
           if (ts.Parent is TExtendedNoteBook) then begin
             ten := (ts.Parent as TExtendedNoteBook);
             editorTS := ten.FindNextPage(ten.ActivePage,true, true);
             //showMessage('editorTS.Name= '+editorTS.Name+' Componentcount='+IntToStr(editorTS.ComponentCount)+' Controlcount=' +Inttostr(editorTS.ControlCount) );
             if editorTS <> nil then begin
                for xi := 0 to editorTS.ControlCount-1 do begin
                    if editorTS.Controls[xi] is TSynEdit then
                      theSynEdit := (editorTS.Controls[xi] as TSynEdit);
                end;
             end;
           end;
         end;
      end;
   end;

   if (theSynEdit = nil) then showMessage('Editor not found!');
   classFound := false;
   ioClass := DesignClass;
   if not StickyClass then begin
     DesignClass := '';
     SelectButton.Down  := true;
   end;
   userCodeBeginLine := theSynEdit.Lines.IndexOf('# widgets begin here - do not remove this line');
   userCodeEndLine   := theSynEdit.Lines.IndexOf('# widgets end here  - do not remove this line');
   if (userCodeEndLine > 0) then begin
     case ioClass of
         'TlvButton': begin
                      theSynEdit.Lines.insert(userCodeEndLine-1, 'btn = lv.btn(scr)  ');
                      theSynEdit.Lines.insert(userCodeEndLine, 'btn.align(lv.ALIGN.CENTER, 0, 0) ');
                      classFound := true;
                    end;
         'TlvPanel': begin
                      theSynEdit.Lines.insert(userCodeEndLine-1, 'Panel');
                      classFound := true;
                   end;
         'TlvImage': begin
                      theSynEdit.Lines.insert(userCodeEndLine-1, 'Image');
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
                SynEdit1.Lines.add(' unknown ioClass: '+ioClass);

   end;
   if classFound = false then
      Statusbar1.Panels[0].text := Statusbar1.SimpleText+' CLASS NOT FOUND';
end;

{
procedure TfrmIDEmain.PropertyNames2Grid(C : TComponent);
Var P : PPropList;
    pTPI: PPropInfo;
    TPI: TPropInfo;
    I,N : Integer;
    RT : TRTTIType;
    Ctx : TRTTIContext;
    RttiProp : TRttiProperty;
    propValue: TValue;
    sPropName, propNameValue, sPropVal: string;
    currGridRow, propAsInt: integer;
begin
     currGridRow := 0;
     N:=TypInfo.GetPropList(C,P);
     try
        I:=0;
        While I<N do begin
              currGridRow := currGridRow+1;
              pTPI := P^[I];
              TPI := pTPI^;
              sPropName := TPI.Name; // P^[I].Name;

              Ctx:=TRTTIContext.Create;
              try

                RT:=Ctx.GetType(ClassInfo);
                 RttiProp:=rt.GetProperty(sPropName);
                 propValue := RttiProp.GetValue(C);
                 if propertEditor.RowCount > currGridRow then propertEditor.RowCount:= currGridRow+1;
                 propNameValue := sPropName+chr(13)+chr(10);

                 try
                    case RttiProp.PropertyType.TypeKind of
                         tkInteger : begin propAsInt := propValue.AsInteger; propNameValue := propNameValue+Inttostr(propAsInt); end;
                         //tkEnumeration : begin propAsInt := propValue.AsInteger; propNameValue := propNameValue+Inttostr(propAsInt); end;
                         tkUString : begin sPropVal := propValue.AsString; propNameValue := propNameValue+sPropVal; end;
                         tkString  : begin sPropVal := propValue.AsString; propNameValue := propNameValue+sPropVal; end;
                    end;
                    //if (propValue.IsEmpty = false) then
                    //  propNameValue := propNameValue + propValue.AsString;
                    propertEditor.Rows[currGridRow].Text := propNameValue;
                 except
                    showMessage('excption on '+propNameValue);
                 end;

              finally
                 Ctx.free;
              end;
              Inc(I);
        end;
     finally
        FreeMem(P);
     end;
end;
}

procedure TfrmIDEmain.JvDesignPanelSelectionChange(Sender: TObject);
var aa: TplDesignObjectArray;
begin
     //Statusbar1.Panels[1].text := sender.className;

     aa := JvDesignPanel.Surface.Selected;
     if length(aa) > 0 then begin
        if ( aa[0] is TComponent) then begin
           //plObjectInspector1.Selected := TComponent(aa[0]);
           //PropertyNames2Grid(TComponent(aa[0]) );
        end;
     end;

end;

procedure TfrmIDEmain.mscrPascalScript1RunLine(aSender: TmscrScript;
  const aUnitName, aSrcPosition: String);
begin

end;

procedure TfrmIDEmain.PaletteButtonClick(Sender: TObject);
var tc: TControl;
begin
   // StickyClass := (GetKeyState(VK_SHIFT) < 0);
   StickyClass := False;
   tc := TControl(Sender);
   if (tc is TToolButton) then begin
      DesignClass := 'Tlv'+(tc as TToolButton).hint;
      if (tc as TToolButton).hint = 'Line' then begin
          showMessage('Line not yet implemented');
          DesignClass := '';
      end;
   end else
      DesignClass := '';
end;

procedure TfrmIDEmain.PaletteButtonMouseEnter(Sender: TObject);
begin
   if (Sender is TControl) then
    Statusbar1.Panels[1].text := (sender as TControl).Hint;
end;

procedure TfrmIDEmain.PaletteButtonMouseLeave(Sender: TObject);
begin
     Statusbar1.Panels[1].text := '';
end;





end.

