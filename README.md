# cornea_egf_tgf-b
EGF AND TGF-β IN CORNEAL WOUND HEALING MATLAB MODEL
Matlab scripts used in paper below 
(figures and equations available upon request)

Computational modeling of epidermal growth factor and transforming growth factor Beta dynamics in corneal wound healing.

Liam Sweeney1 and Ronald Zambrano1

1.	Drexel University School of Biomedical Engineering, Science and Health Systems, Philadelphia, PA, USA

I. Introduction
The structure and integrity of the cornea epithelium is critical for maintaining ocular function and serves as a line of defense against injury. As such, it has a robust process for cell proliferation, migration, and apoptosis. When an injury occurs to the epithelium, it is critical that it heals quickly in order to regenerate normal corneal function. This involves a complex signaling cascade between epithelial cells, keratinocytes, fibroblasts, and immune cells dictated by a number of cytokines and factors [1]. Ultimately, this signaling cascade causes epithelial cells to lay down actin filaments and integrins and form a thin film as they migrate across the wound. Underneath this actin layer, keratinocytes and fibroblasts rebuild the matrix beneath with collagens and other extracellular matrix proteins to re-establish the integrity of the epithelium and fully heal the wound [1]. 
One important factor in corneal epithelial wound healing is epidermal growth factor (EGF). EGF is secreted by immune cells, specifically macrophages and platelets, along with fibroblasts, and, in this context, produced locally by the epithelium and lacrimal glands in the eye [1]. The secretion of EGF by these cells is used to signal to epithelial cells when a wound is introduced to the cornea. Notably, expression of EGF and TGF-α receptors is generally elevated during corneal wound healing [1]. Research has examined the possibility of taking advantage of the effect of EGF on corneal wound healing and have studied topical treatments to  shorten wound closure and repair of refractory persistent epithelial defects (PED) such as those present in surgical incisions, complex wounds, diabetic or other pathogenic insults [2]. These studies have generally been successful, showing the promise of EGF in future applications of wound healing. 
TGF-β is another critical factor in corneal epithelial wound healing and has differential effects depending on the cell type. For example, with keratinocytes, it has been reported that TGF-β can promote keratinocyte proliferation [3]. On the other hand, TGF-β has been shown to inhibit proliferation of corneal epithelial cells, a crucial component for corneal epithelial wound healing[4]. Furthermore, it has been reported by Shu et. al. [5] and Mishima et al [6] that this may occur through the inhibition of the EGF induced proliferation of corneal epithelial cells. This is indicated with the increased expression of TGF-β receptor II in corneal epithelial cells. 
II. Methodology 
A.	Reasoning	
Dale et. al. [7] understood that EGF may play a significant role in corneal epithelial wound healing and sought to model that role through a mathematical model of epithelial cell proliferation dependent on EGF concentration across a corneal wound. After modeling the effect of corneal epithelial wound healing with EGF, they found that growth-factors derived from serum are generally responsible for corneal epithelial wound-healing, specifically EGF, but that both migration and proliferation of epithelial cells also are vital for wound-healing. 
Since this model was developed many years ago, our understanding of the underlying mechanisms of corneal epithelial wound healing has advanced significantly. Most notably, there is a general understanding that the interaction of multiple growth factors and cell types govern the efficacy of wound-healing. Most notably, it is understood that TGF-β is a potent inhibitor of cell proliferation [8], thus may have an inhibitory effect on the EGF induced corneal epithelial cell proliferation during wound healing. In this paper, we seek to build on the findings of Dale et. al. [7] by incorporating the inhibitory effects of TGF-β on corneal epithelial cell proliferation in a simple, dimensionless, Ordinary Differential Equation (ODE) model of cell density over time dependent on both EGF and TGF-β with the hope of elucidating an incrementally more accurate model of corneal epithelial wound healing. 
B. Graphical Model	
A graphical model was created to lay out the roles of EGF, TGF-β and Cell density on corneal epithelium wound healing. Using Haefner’s [9] principles on qualitative model formation and Dale et. al.’s [7] mathematical modeling of corneal epithelial wound healing, a Forester diagram was created for the relevant state variables, auxiliary variables, and parameters for demonstrating their interaction (Figure 1).
 
Figure 1. Forrester diagram of corneal epithelial wound healing and cell growth mediated by EGF and TGF-β. 
C. Mathematical Equations 
Dale et. al.’s [7] mathematical equations were adopted and modified for this study for EGF (1) and Cell Density (2). Although the Dale et al model also accounted for spatial dynamics of EGF and cell proliferation, for simplicity's sake, this study modified the original equations to bypass the partial derivative equations (PDE) accounting for cell movement and diffusion, making the equations dimensionless. Furthermore, since our hypothesis that TGF-β inhibits EGF and cell proliferation were not included Dale et. al.’s [7] paper, an equation for TGF-β was proposed (3).  The equation for TGF-β was derived based on the Dale et. al.’s [7] EGF equation and numerous in vitro studies [5, 10, 11]. Model state variables and parameters were derived from Dale et. al. [7] (Table 1, Table 2).
1) EGF
 
Change in EGF concentration = production - consumption - decay
2) Cell density
 
Change in Cell density = EGF mediated cell diffusion/conservation – TGF-β mediated cell diffusion/conservation – cell death

3) TGF-β
 
Change in TGF-β concentration = production – consumption – decay

Table 1. Model State variables.	
State variable description	Symbol	Initial Value	Units
EGF concentration	E	6.6 x 10-10	M
TGF-β concentration	T	10-10	M
Cell density	N	10-12	#
Table 2. Model parameter values.
Parameter description	Symbol	Value	Units
cellular diffusion coefficient alpha	α1	0.9	cm2/s-1
cellular diffusion coefficient beta	𝛽1	0.1	cm2/s-1
cell conservation equation constant	v	2	cm2/s-1
cell cycle rate constant	K	6.31 x 10-3	h-1
overlying tear film constant supplies EGF	A	0.2	M
EGF receptor binding constant	𝜇	1.37 x 104	M
concentration of EGF in reflex tears	E1	4	ng/ml-1
chemical half-life in absence of cellular degradation	σ	log 2	h-1
overlying tear film constant supplies TGF-𝛽	A2	0.18	M
TGF-𝛽 receptor binding rate constant	𝜇2	4 x 104	mol/cell-1/h-1
III. Results 			
A. Simulation 
Simulations of the mathematical models were designed and run on Matlab R2023b (MathWorks, Inc.) using the built-in Fourth Order Runge-Kutta (RK4) method calculator. These Matlab scripts are available publicly on GitHub and free to use under the MIT distribution License.  Change in EGF, TGF-β and Cell density over time were simulated (Figure 2). Both, EGF and TGF-β exhibited similar logarithmic pattern, expectedly, as both equations are near identical except for differences in parameters A, 𝜇, and A2, 𝜇2, respectively. Change in Cell density also exhibited a logistic growth pattern as commonly seen in population growth models [12]. Additionally, 3-D surface plots demonstrating the coalescing effects of each state variable were simulated by changing the rate at which TGF-𝛽 was supplied to the wound over time (Figure 3).

Figure 2. Change in (A) EGF and TGF-𝛽 concentration over time during corneal epithelial wound healing and (B) change in cell density over time were simulated. 

Figure 3. Change in (A) EGF concentration, (B) TGF-𝛽 concentration, and (C) cell density over time was plotted in 3D against the inflow of TGF-𝛽, simulating each state variable continuously.	
B. Sensitivity Analysis
Sensitivity analysis simulations were performed to determine the effect of parameter perturbation on cell density. Specifically, sensitive objective function (SOF) was calculated as the ratio of percentage change in outcome over percentage change of rate, as suggested by  Aldridge et al [13].Excluding state variables, system model parameters were individually perturbed by 5% steps until the 24 hour time point. SOF % for each parameter was ranked in order of most change to least (Table 3). Surprisingly, the overlying tear film supply of EGF constant had the most profound effect on cell density when perturbed, followed by direct cellular conservation and diffusion coefficients. This may say more about the stability of the cell cycle than the effect of EGF on the system.  The overlying tear film supply of TGF-𝛽 had the least effect on epithelial wound healing, implying that EGF has a greater influence on wound healing. Regardless, all parameter SOFs were below 20% in the simulation, suggesting a robust system.
Table 3. Sensitive Objective Function (SOF) analysis results		
Parameter description	Symbol	SOF (%)	Rank
overlying tear film constant supplies EGF	A	17.724	1
cell conservation equation constant	v	16.983	2
cellular diffusion coefficient alpha	α1	15.462	3
cellular diffusion coefficient beta	𝛽1	15.061	4T
EGF receptor binding constant	𝜇	15.061	4T
concentration of EGF in reflex tears	E1	15.061	4T
TGF-𝛽 receptor binding rate constant	𝜇2	15.061	4T
cell cycle rate constant	K	14.954	7
overlying tear film constant supplies TGF-𝛽	A2	9.309	8
C. Robustness Analysis 
System robustness against perturbation were also simulated. Phase plots were created for expressing the effect of change in Cell Density over time by changing the initial conditions for EGF, TGF-𝛽, and Cell density (Figure 4). Initial conditions of each state variable were plotted alongside their values at moderate perturbation (0.1), and high perturbation (1.0). Both EGF and TGF-𝛽 simulations demonstrated similar effect to the perturbation showing a slight initial deviation but subsequent return to equal levels by the end of the 24-hour period. Perturbation had a greater effect on change in cell density, as it took more than 100 hours for cell density to reach initial condition levels. However, both moderate and high perturbations did eventually reach similar levels as the initial condition model after 100-hours. The inability of these perturbations to break the limits of the model or the model itself, suggests a highly robust system.

Figure 4. Phase plots demonstrating the effect of perturbation to the initial state variable conditions for (A) EGF, (B) TGF-𝛽, and (C) Cell density. Original model parameters are shown in blue, moderate perturbation in red, and high perturbation in yellow.  
D. Validation 
In order to validate the results of the model, previous literature regarding the effect of EGF on the change in cell density can be examined to understand if similar trends are represented in this model  (Figure 5). A plot sourced from Barrandan and Green [14] showing the change in colony radius, as a measure of cell density, over time when EGF is supplied to epithelial cells (open circles) vs when no growth factors are applied to epithelial cells (triangles Barrandan and Green [14]. The length of time is different between the models, but that is rational given that our model simulates an in-vivo change in cell density rather than in-vitro change as is represented in the paper from Barrandan and Green [14]. Despite the differences in the studies, the general shape and trend of the curves appears to be similar between the model and the in vitro work. This indicates that we have a relative degree of accuracy in the simulation. It is also important to note that we see the change in cell density as lower when TGF-𝛽 is taken into account with EGF rather than EGF alone. This is rational given the previously cited literature which indicates that TGF-𝛽 has an inhibitory effect on the EGF stimulated increase in epithelial cell density during corneal epithelial wound healing [8].


Figure 5. EGF and TGF-β effects on cell density over time in this study model (A) exhibited similar pattern’s to those exhibited in in vitro experimental observations by Barrandan and Green [14] (B)
IV. Discussion 
The model proposed herein expands on the model described by Dale et al [7]by demonstrating that TGF-𝛽 plays an inhibitory regulatory role in epithelial cell proliferation. This is supported by recent literature suggesting that TGF-𝛽 is an inhibitory factor in the EGF-induced stimulus of cellular proliferation and migration, although the model shows the influence to be limited. The proposed model has also demonstrated significant robustness with low SOF values for all constants and has been validated against current in-vitro data available in the literature [10, 14]. This work has set the foundation for future models to be applied with partial differential equations to show the flow of cell density and both EGF and TGF-𝛽 concentrations through a 3-dimensional wound. Furthermore, inclusion of additional parameters and state variables, such as TGF-α, which has been shown to have a more significant regulatory role [15], should be considered. In conclusion, the simple mathematical model proposed here merits further expansion and investigation, as it improves our understanding of corneal wound healing, which in turn could lead to improved care and preservation of vision.
V. References
1.	Wilson, S.E., Corneal wound healing. Exp Eye Res, 2020. 197: p. 108089.
2.	Moon, H.S., et al., Effect of epidermal growth factor ointment on persistent epithelial defects of the cornea. BMC Ophthalmol, 2020. 20(1): p. 147.
3.	Liarte, S., Á. Bernabé-García, and F.J. Nicolás, Role of TGF-β in Skin Chronic Wounds: A Keratinocyte Perspective. Cells, 2020. 9(2).
4.	Tandon, A., et al., Role of transforming growth factor Beta in corneal function, biology and pathology. Curr Mol Med, 2010. 10(6): p. 565-78.
5.	Shu, D.Y., et al., Epidermal Growth Factor Stimulates Transforming Growth Factor-Beta Receptor Type II Expression In Corneal Epithelial Cells. Scientific Reports, 2019. 9(1): p. 8079.
6.	Mishima, H., et al., Transforming growth factor-beta modulates effects of epidermal growth factor on corneal epithelial cells. Curr Eye Res, 1992. 11(7): p. 691-6.
7.	Dale, P.D., P.K. Maini, and J.A. Sherratt, Mathematical modeling of corneal epithelial wound healing. Mathematical Biosciences, 1994. 124(2): p. 127-147.
8.	Kubiczkova, L., et al., TGF-β – an excellent servant but a bad master. Journal of Translational Medicine, 2012. 10(1): p. 183.
9.	Haefner, J.W., Modeling biological systems:: principles and applications. 2005: Springer Science & Business Media.
10.	Yu, F.S., et al., Growth factors and corneal epithelial wound healing. Brain Res Bull, 2010. 81(2-3): p. 229-35.
11.	Schultz, G., et al., Growth factors and ocular wound healing. Eye, 1994. 8(2): p. 184-187.
12.	Jin, W., S.W. McCue, and M.J. Simpson, Extended logistic growth model for heterogeneous populations. J Theor Biol, 2018. 445: p. 51-61.
13.	Aldridge, B.B., et al., Physicochemical modelling of cell signalling pathways. Nature Cell Biology, 2006. 8(11): p. 1195-1203.
14.	Barrandon, Y. and H. Green, Cell migration is essential for sustained growth of keratinocyte colonies: The roles of transforming growth factor-α and epidermal growth factor. Cell, 1987. 50(7): p. 1131-1137.
15.	McClintock, J.L. and B.P. Ceresa, Transforming Growth Factor-α Enhances Corneal Epithelial Cell Migration by Promoting EGFR Recycling. Investigative Ophthalmology & Visual Science, 2010. 51(7): p. 3455-3461.

