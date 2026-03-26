function varargout = ROBOT(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name', mfilename, ...
                   'gui_Singleton', gui_Singleton, ...
                   'gui_OpeningFcn', @ROBOT_OpeningFcn, ...
                   'gui_OutputFcn', @ROBOT_OutputFcn, ...
                   'gui_LayoutFcn', [] , ...
                   'gui_Callback', []);

if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end


% --- Executes just before ROBOT is made visible.
function ROBOT_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

startup_rvc
global robot
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

%% LINK LENGTHS
a1 = 60;
a2 = 110;
a3 = 100;

%% D-H PARAMETERS
H0_1 = Link([0,a1,0,deg2rad(270),0,0]);
H1_2 = Link([0,0,a2,pi,0,deg2rad(270)]);
H2_3 = Link([0,0,a3,0,0,deg2rad(270)]);

robot = SerialLink([H0_1 H1_2 H2_3],'name','3-DOF');

robot.plot([0 0 0],'workspace',[-160 160 -160 160 -50 200])

T = robot.fkine([0 0 0]);
position = T.t;

disp('End-effector Position [x y z]')
disp(position')

axes(handles.axes1);

set(handles.edit8,'String',num2str(position(1),'%.2f'));
set(handles.edit9,'String',num2str(position(2),'%.2f'));
set(handles.edit10,'String',num2str(position(3),'%.2f'));

guidata(hObject,handles);


% --- Outputs from this function are returned to the command line.
function varargout = ROBOT_OutputFcn(hObject, eventdata, handles)

varargout{1} = handles.output;


% --- BUTTON PRESS (MOVE ROBOT)
function pushbutton3_Callback(hObject, eventdata, handles)

clc
startup_rvc

global robot q_prev

if isempty(q_prev)
    q_prev = [0 0 0];
end

%% READ GUI INPUT

q1_deg = str2double(get(handles.edit1,'String'));
q2_deg = str2double(get(handles.edit2,'String'));
q3_deg = str2double(get(handles.edit3,'String'));
gripper = str2double(get(handles.edit11,'String'));

%% CONVERT TO RADIANS

q1 = deg2rad(q1_deg);
q2 = deg2rad(q2_deg);
q3 = deg2rad(q3_deg);


%% SEND TO ARDUINO

servo1 = q1_deg;
servo2 = q2_deg;
servo3 = q3_deg;
servo4 = gripper;

cmd = sprintf("SERVO %d %d %d %d",servo1,servo2,servo3,servo4);

if ~isempty(handles.serial)

    writeline(handles.serial,cmd);
    disp("Sent: " + cmd)

else

    disp("Arduino not connected")

end


%% ROBOT MODEL

a1 = 60;
a2 = 110;
a3 = 100;

H0_1 = Link([0,a1,0,deg2rad(270),0,0]);
H1_2 = Link([0,0,a2,pi,0,deg2rad(270)]);
H2_3 = Link([0,0,a3,0,0,deg2rad(270)]);


q = [q1 q2 q3];

q_start = q_prev;

nSteps = 10;

q_traj = jtraj(q_start,q,nSteps);

robot = SerialLink([H0_1 H1_2 H2_3],'name','3-DOF');

robot.plot(q_traj(1,:),'workspace',[-160 160 -160 160 -50 200])

for i = 1:nSteps
    robot.animate(q_traj(i,:));
    pause(0.05)
end

q_prev = q;

%% FORWARD KINEMATICS

T = robot.fkine(q);
position = T.t;

disp('End-effector Position Vector')
disp(position')

axes(handles.axes1);

set(handles.edit8,'String',num2str(position(1),'%.2f'));
set(handles.edit9,'String',num2str(position(2),'%.2f'));
set(handles.edit10,'String',num2str(position(3),'%.2f'));
