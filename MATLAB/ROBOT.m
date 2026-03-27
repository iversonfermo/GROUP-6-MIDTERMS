 function varargout = ROBOT(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ROBOT_OpeningFcn, ...
                   'gui_OutputFcn',  @ROBOT_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before ROBOT is made visible.
function ROBOT_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;
startup_rvc
global robot;

clear global q_prev

%% SERIAL CONNECTION TO ARDUINO
try
    handles.serial = serialport("COM5",115200); % CHANGE PORT IF NEEDED
    configureTerminator(handles.serial,"LF");
    pause(2); % Arduino reset time
    disp("Arduino Connected")
catch
    handles.serial = [];
    disp("Arduino not detected - Simulation Mode")
end

%% Link lengths
a1 = 60;
a2 = 110;
a3 = 100;

%% D-H Parameters [theta, d, r, alpha, offset]
% if prismatic joint: theta = theta, d = 0, offset = 1, after offset put the value of d
% if revolute joint: theta = 0,offset = 0, after offset put the value of theta

H0_1 = Link([0,a1,0,pi/2,0,0]);


H1_2 = Link([0,0,a2,0,0,deg2rad(90)]);


H2_3 = Link([0,0,a3,0,0,deg2rad(270)]);


robot = SerialLink([H0_1 H1_2 H2_3], 'name', '3-DOF');
robot.plot([0 0 0], 'workspace', [-160 160 -160 160 -50 200])
T = robot.fkine([0 0 0]);
position = T.t;

disp('End-effector Position Vector [x y z]:');
disp(position');

axes(handles.axes1);
set(handles.edit8, 'String', num2str(position(1), '%.2f'));  % X
set(handles.edit9, 'String', num2str(position(2), '%.2f'));  % Y
set(handles.edit10, 'String', num2str(position(3), '%.2f'));  % Z


% s = serialport("/dev/ttyUSB0", 115200);


% servo1 =0;
% servo2 =0;
% servo3 = 0;
% servo4 = 0;
% 
% cmd = sprintf("SERVO %d %d %d %d",  servo1, servo2, servo3, servo4);
% writeline(s, cmd);
% disp("Sent:" + cmd);
% 
% clear s;


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ROBOT wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ROBOT_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

clc;
startup_rvc


global robot q_prev;   % Add this to store previous joint state


if isempty(q_prev)
    q_prev = [0 0 0]; 
end

q1_deg = get(handles.edit1, 'String');   
q1_deg = str2double(q1_deg);              
q1 = deg2rad(q1_deg);

q2_deg = get(handles.edit2, 'String');   
q2_deg = str2double(q2_deg);              
q2 = deg2rad(q2_deg);

q3_deg = get(handles.edit3, 'String');   
q3_deg = str2double(q3_deg);              
q3 = deg2rad(q3_deg);

gripper = get(handles.edit11, 'String');
gripper = str2double(gripper);


% s = serialport("/dev/ttyUSB0", 115200);
% 
% 
% servo1 = q1_deg;
% servo2 = q2_deg;
% servo3 = q3_deg;
% servo4 = gripper;
% 
% cmd = sprintf("SERVO %d %d %d %d",  servo1, servo2, servo3, servo4);
% writeline(s, cmd);
% disp("Sent:" + cmd);

%clear s;

try
    % Replace "COM3" with your actual ESP32 port when you connect it
    s = serialport("COM3", 115200); 

    servo1 = q1_deg;
    servo2 = q2_deg;
    servo3 = q3_deg;
    servo4 = gripper;

    cmd = sprintf("SERVO %d %d %d %d",  servo1, servo2, servo3, servo4);
    writeline(s, cmd);
    disp("Sent: " + cmd);

    clear s;
catch
    % If the robot is unplugged or the port is wrong, run this instead:
    disp('Hardware not detected. Running in Virtual Mode...');
end


%syms a1 a2 a3


%% Link lengths
a1 = 60;
a2 = 110;
a3 = 100;

%% D-H Parameters [theta, d, r, alpha, offset, theta_offset]
H0_1 = Link([0,a1,0,pi/2,0,0]);
H1_2 = Link([0,0,a2,0,0,deg2rad(90)]);
H2_3 = Link([0,0,a3,0,0,deg2rad(270)]);


q = [q1 -q2 q3]; 
q_start = q_prev;
nSteps = 10;
q_traj = jtraj(q_start, q, nSteps);

robot = SerialLink([H0_1 H1_2 H2_3], 'name', '3-DOF');
robot.plot(q_traj(1,:), 'workspace', [-160 160 -160 160 -50 200]);

for i = 1:nSteps
    robot.animate(q_traj(i, :));
    pause(0.05);
end


q_prev = q;


T = robot.fkine(q);
position = T.t;

disp('End-effector Position Vector [x y z]:');
disp(position');

axes(handles.axes1);
set(handles.edit8, 'String', num2str(position(1), '%.2f'));  % X
set(handles.edit9, 'String', num2str(position(2), '%.2f'));  % Y
set(handles.edit10, 'String', num2str(position(3), '%.2f'));  % Z






function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

