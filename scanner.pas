unit scanner;
uses Sysutils;


interface

type
    TTokenType = (TOK_NUMBER, TOK_WORD, TOK_LEFTPAREN, TOK_RIGHTPAREN, TOK_SEP);
    TToken = record
        tType: TTokenType;
        value: String;
    end;
    
    TScanState = record
        fileName: String;
        fileHandle: TextFile;
        currChar: UInt32;
        currLine: UInt32;
        isActive: boolean;
    end;
    
    PTScanState = ^TScanState;

    procedure startScan(fileName: String, scanState:PTScanState);
    procedure stopScan(scanState: PTScanState);
    function nextToken(scanState: PTScanState): TToken;

implementation

	procedure startScan(fileName: String, scanState:PTScanState)
    begin
        TextFile f;
        AssignFile(f, fileName);
        try
            reset(f);
            scanState^.fileName := fileName;
            scanState^.fileHandle := f;
            scanState^.currChar := 0;
            scanState^.currLine := 0;
            scanState^.isActive := true;
        except
            on E: EInOutError do
                writeln('File open error ['+ fileName +']: ', E.Message);
        end;
    end;
    
    procedure stopScan(scanState: PTScanState)
    begin
        CloseFile(scanState^.fileHandle);
        scanState^.isActive := false;
    end;

    function nextToken(scanState: PTScanState): TToken
    begin
    //TODO:
    end;

end.