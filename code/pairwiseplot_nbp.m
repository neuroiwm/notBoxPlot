function pairwiseplot_nbp(input_nbp, k, l, data)

if nargin < 1
    return;
end

if nargin < 3
    k = 0.5;
end

if nargin < 4
    l = 1.5;
end

if nargin < 5
    data = NaN;
end

pairwiseplot_nbp_(input_nbp, k, l, data);
end

function pairwiseplot_nbp_(input_nbp, k, l, data)

if nargin < 2
    k = 0.5;
end

if nargin < 3
    l = 1.5;
end

num_box = numel(input_nbp);
x = [];
y = [];

if numel(k) == 1
    col = ones(1, 3) * k;
else
    col = k;
end

if isnan(data)

    for i_box = 1:num_box
        x = [x; input_nbp(i_box).data.XData];
        y = [y; input_nbp(i_box).data.YData];
    end

else

    for i_box = 1:num_box
        x = [x; {input_nbp(i_box).data.XData}];
        y = [y; {input_nbp(i_box).data.YData}];
    end

    y = data;
    x_ = y;

    for i_box = 1:num_box
        x_(~isnan(x_(:, i_box)), i_box) = x{i_box};
    end

    x = x_;
    is_nan = find(any(isnan(y), 2));
    x(is_nan, :) = [];
    y(is_nan, :) = [];
    x = x';
    y = y';
end

l = plot(x, y, 'LineWidth', l, 'Color', col);

for i_lin = 1:numel(l)    
    off_legend(l(i_lin));
end

ax = gca;
ax = bringFront_nbp(ax);
ax = bringBack_nbp(ax);
end


function off_legend(h)
for i_h = 1 : numel(h)
    hAnnotation = get(h(i_h),'Annotation');
    hLegendEntry = get(hAnnotation,'LegendInformation');
    set(hLegendEntry,'IconDisplayStyle','off')
end
end


function ax = bringFront_nbp(ax)

if nargin < 2
    ax = gca;
end

child = ax.Children;
obj_scatter = findobj('LineStyle', 'none');
idx_scatter = [];

for i_child = 1:numel(obj_scatter)
    idx_scatter = [idx_scatter, (child == obj_scatter(i_child))];
end

idx_scatter = logical(sum(idx_scatter, 2));
ax.Children = [child(idx_scatter); child(~idx_scatter)];

end

function ax = bringBack_nbp(ax)

if nargin < 2
    ax = gca;
end

child = ax.Children;
obj_patch = findobj('Type', 'Patch');
idx_patch = [];

for i_child = 1:numel(obj_patch)
    idx_patch = [idx_patch, (child == obj_patch(i_child))];
end

idx_patch = logical(sum(idx_patch, 2));
ax.Children = [child(~idx_patch); child(idx_patch)];
end