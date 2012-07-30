function varargout = newmusic(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newmusic_OpeningFcn, ...
                   'gui_OutputFcn',  @newmusic_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
function newmusic_OpeningFcn(hObject, eventdata, handles, varargin)
handles.fs=4000;
handles.ts=1/handles.fs;
varfreq=136;
set(handles.popupmenu1,'Value',5);
for i=1:42
    m=1;
    for j=0:handles.ts:6
    handles.alltones(i,m)=2*sin(2*pi*j*varfreq);
    m=m+1;
    end
    varfreq=varfreq*(2^(1/12));
end
handles.output = hObject;
guidata(hObject, handles);
function varargout = newmusic_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;
function popupmenu1_Callback(hObject, eventdata, handles)
function popupmenu1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function popupmenu2_Callback(hObject, eventdata, handles)
function popupmenu2_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function popupmenu3_Callback(hObject, eventdata, handles)
function popupmenu3_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function popupmenu4_Callback(hObject, eventdata, handles)
function popupmenu4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton4_Callback(hObject, eventdata, handles)
handles.flag=0;
alankarastatus=get(handles.popupmenu4,'Value');
timeperswara=get(handles.popupmenu1,'Value');
basefreq=get(handles.popupmenu2,'Value');
swaratype=get(handles.popupmenu3,'Value');
if alankarastatus==1
c=[5 7 9 10 12 14 15 17 19 21 22 24 26 27 29];
elseif alankarastatus==2
c=[5 9 7 10 14 12 15 19 17 21 24 22 26 29 27];    
elseif alankarastatus==3
c=[7 9 5  12 14 10  17 19 15 22 24 21  27 29 26];    
elseif alankarastatus==4
c=[7 5 9 12 10 14 17 15 19 22 21 24 27 26 29];    
elseif alankarastatus==5
c=[ 9 5 7 14 10 12  19  15 17 24  21 22 29 26 27 ];    
elseif alankarastatus==6    
c=[9 7 5  14 12 10 19 17 15 24 22 21 29 27 26];    
end
m=1;
for i=1:size(c,2)
    for j=1:size(handles.alltones,2)/(60/timeperswara)
    tmpsndplay(1,m)=handles.alltones(basefreq+c(i),j);
    m=m+1;
    end
end
sound(tmpsndplay,handles.fs);m=1;
for i=size(tmpsndplay,2):-1:1
    tmpsndplay1(1,m)=tmpsndplay(1,i);
    m=m+1;
end
guidata(hObject,handles);
sound(tmpsndplay1,handles.fs);
guidata(hObject,handles);
function popupmenu5_Callback(hObject, eventdata, handles)
function popupmenu5_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function pushbutton6_Callback(hObject, eventdata, handles)
handles.flag=0;
alankarastatus=get(handles.popupmenu4,'Value');
timeperswara=get(handles.popupmenu1,'Value');
basefreq=get(handles.popupmenu2,'Value');
swaratype=get(handles.popupmenu3,'Value');
if alankarastatus==1
c=[5 7 9 7 9 5 10 12 14 12 14 10 15 17 19 17 19 15 21 22 24 22 24 21 26 27 29 27 29 26];
elseif alankarastatus==2
c=[5 7 9 9 5 7 10 12 14 14 10 12 15 17 19 19 15 17 21 22 24 24 21 22 26 27 29 29 26 27];
elseif alankarastatus==3
c=[5 7 9 9 7 5 10 12 14 14 12 10 15 17 19 19 17 15 21 22 24 24 22 21 26 27 29 29 27 26];
elseif alankarastatus==4
c=[5 7 9 7 5 9 10 12 14 12 10 14 15 17 19 17 15 19 21 22 24 22 21 24 26 27 29 27 26 29];
elseif alankarastatus==5
c=[5 9 7 9 7 5 10 14 12 14 12 10 15 19 17 19 17 15 21 24 22 24 22 21 26 29 27 29 27 26];
elseif alankarastatus==6
c=[5 9 7 7 5 9 10 14 12 12 10 14 15 19 17 17 15 19 21 24 22 22 21 24 26 29 27 27 26 29];
elseif alankarastatus==7
c=[5 9 7 7 9 5 10 14 12 12 14 10 15 19 17 17 19 15 21 24 22 22 24 21 26 29 27 27 29 26];
elseif alankarastatus==8
c=[5 9 7 9 5 7 10 14 12 14 10 12 15 19 17 19 15 17 21 24 22 24 21 22 26 29 2729 26 27];
elseif alankarastatus==17
c=[7 9 5 9 5 7 12 14 10 14 10 12  17 19 15 19 15 17 22 24 21 24 21 22 27 29 26 29 26 27];
elseif alankarastatus==18
c=[7 9 5 9 7 5 12 14 10 14 12 10 17 19 15 19 17 15 22 24 21 24 22 21  27 29 26 29 27 26];
elseif alankarastatus==19
c=[7 9 5 5 9 7  12 14 10  10 14 12 17 19 15 15 19 17 22 24 21 21 24 22 27 29 26 26 29 27];
elseif alankarastatus==20
c=[7 9 5 5 7 9  12 14 10 10 12 14  17 19 15 15 17 19 22 24 21 21 22 24 27 29 26 26 27 29];
elseif alankarastatus==21
c=[7 5 9 9 5 7 12 10 14 14 10 12 17 15 19 19 15 17 22 21 24 24 21 22 27 26 29 29 26 27];
elseif alankarastatus==22
c=[7 5 9 9 7 5 12 10 14 14 12 10 17 15 19 19 17 15 22 21 24 24 22 21 27 26 29 29 27 26];
elseif alankarastatus==23
c=[7 5 9 5 7 9 12 10 14 10 12 14 17 15 19 15 17 19 22 21 24 21 22 24 27 26 29 26 27 29];
elseif alankarastatus==24
c=[7 5 9 5 9 7 12 10 14 10 14 12 17 15 19 15 19 17 22 21 24 21 24 22 27 26 29 26 29 27];
elseif alankarastatus==13
c=[ 9 5 7 5 7 9 14 10 12 10 12 14  19  15 17 15 17 19 24  21 22 21 22 24 29 26 27 26 27 29 ];
elseif alankarastatus==14
c=[ 9 5 7 5 9 7 14 10 12 10 14 12 19  15 17 15 19 17  24  21 22 21 24 22 29 26 27 26 29 27 ];
elseif alankarastatus==15
c=[ 9 5 7 7 9 5 14 10 12 12 14 10 19  15 17 17 19 15 24  21 22 22 24 21 29 26 27 27 29 26 ];
elseif alankarastatus==16
c=[ 9 5 7 7 5 9 14 10 12 12 10 14 19  15 17 17 15 19 24  21 22 22 21 24 29 26 27 27 26 29];
elseif alankarastatus==9    
c=[9 7 5 5 7 9 14 12 10 10 12 14 19 17 15 15 17 19 24 22 21 21 22 24 29 27 26 26 27 29];
elseif alankarastatus==10    
c=[9 7 5  5 9 7 14 12 10 10 14 12 19 17 15 15 19 17 24 22 21 21 24 22  29 27 26 26 29 27];
elseif alankarastatus==11   
c=[9 7 5 7 5 9 14 12 10 12 10 14 19 17 15 17 15 19  24 22 21 22 21 24 29 27 26 27 26 29];
elseif alankarastatus==12   
c=[9 7 5 7 9 5 14 12 10 12 14 10 19 17 15 17 19 15 24 22 21 22 24 21 29 27 26 27 29 26];
end
m=1;
for i=1:size(c,2)
    for j=1:size(handles.alltones,2)/(60/timeperswara)
    tmpsndplay(1,m)=handles.alltones(basefreq+c(i),j);
    m=m+1;
    end
end
sound(tmpsndplay,handles.fs);m=1;
for i=size(tmpsndplay,2):-1:1
    tmpsndplay1(1,m)=tmpsndplay(1,i);
    m=m+1;
end
guidata(hObject,handles);
sound(tmpsndplay1,handles.fs);
guidata(hObject,handles);