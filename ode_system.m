
%BMES 511 Group 6
%This function represents the ODE's for the combination effect of EGF and
%TGF-beta and on cell density during corneal epithelial wound healing
%This function will only represent the change in these state variables over
%time and not space


function dydt=ode_system(t, y, Dc, alpha1, beta1, v, k, u, A, delta, n0, c1,A2,E1,u2)

%extract intial conditions for cell density, EGF concentration, and
%TGF-beta concentration
n=y(1);
c=y(2);
E=y(3);

%Initialize 3 row vector for output derivative. Each column is a vector of
%the state variable over time
dydt=zeros(3, 1);

% Compute gradients as described in Dale et al. In this case, there is no
% space vector x input as we are focused solely on change over time.
% However, this function could be modified to handle both change in time
% and space in future iterations
if numel(n)>1
    grad_n=gradient(n);
else
    grad_n=0; % If n is scalar, gradient is 0
end

if numel(c)>1
    grad_c=gradient(c);
else
    grad_c=0; 
end

if numel(E)>1
	grad_E=gradient(E);
else
	grad_E=0;
end


% Compute gradients as described in Dale et al. In this case, there is no
% space vector x input as we are focused solely on change over time.
% However, this function could be modified to handle both change in time
% and space in future iterations
if numel(n)>1
    div_n = divergence(grad_n(:,1), grad_n(:,2));
else
    div_n=0; % If n is scalar, divergence is 0
end

if numel(c)>1
    div_c = divergence(grad_c(:,1), grad_c(:,2));
else
    div_c=0; % If c is scalar, divergence is 0
end

if numel(E)>1
    div_E=divergence(grad_E(:,1), grad_E(:,2));
else
    div_E=0; % If n is scalar, divergence is 0
end


% Output ODEs as described in Dale et al

%cell density: This now takes into account the production of TGF-beta by
%cells as an inhibitory effect for cell density as the last term as well as
%the additive effect of EGF on cell density in the second term
dydt(1)=div_n+(alpha1*c + beta1)*n*(v-(n/n0))-(alpha1*E+beta1)*n*(v-(n/n0))-k*n;

%Change in EGF concentration over time per Dale et al
dydt(2)=div_c+A-(u*c/(c1+c))*n - delta*c;

%Change in TGF-beta concentration over time (adapted from dale et al
dydt(3)=div_E+ A2 -(u2*E/(E1+E))*n - delta*E;


