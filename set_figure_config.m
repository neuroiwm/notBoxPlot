
Font_def = 'Arial';
set(groot, 'defaultAxesFontName', Font_def);
set(groot, 'defaultTextFontName', Font_def);
set(groot, 'defaultLegendFontName', Font_def);
set(groot, 'defaultColorbarFontName', Font_def);

col_ax = [0 0 0];
set(0, 'defaultfigurecolor', [1 1 1], "DefaultAxesXColor", col_ax, "DefaultAxesYColor", col_ax, 'DefaultLineLineWidth', 2);