set_figure_config;
addpath('./code/');
%% 
data_input = randn(15,3);
is_paired = 1;
obj_nbp = notBoxPlot(data_input);
obj_nbp = modify_notBoxPlot(obj_nbp,8);

if is_paired
    pairwiseplot_nbp(obj_nbp);
end

set(gca,'FontSize',20);
