function obj_nbp = modify_notBoxPlot(obj_nbp, pointsz, input_color)

arguments    
    obj_nbp = [];
    pointsz = 8;
    input_color = [];
end

assert(~isempty(obj_nbp), 'input not enough')

if isempty(input_color)
    input_color = color_default();
end

Fnames = fieldnames(obj_nbp);

for i = 1:numel(obj_nbp)
    obj_nbp(i).box.FaceColor = [0.5 0.5 0.5];
    obj_nbp(i).box.EdgeColor = [0 0 0];
    obj_nbp(i).sdPtch.FaceColor = [0.5 0.5 0.5];
    obj_nbp(i).sdPtch.EdgeColor = [0.5 0.5 0.5];
    obj_nbp(i).semPtch.FaceColor = [0.65 0.65 0.65];
    obj_nbp(i).semPtch.EdgeColor = [0.65 0.65 0.65];
    obj_nbp(i).mu.Color = [0 0 0];

    if pointsz <= 4
        obj_nbp(i).mu.LineWidth = 0.25;
    end

    if ~isempty(obj_nbp(i).data)
        obj_nbp(i).data.MarkerFaceColor = input_color(:, min(i, size(input_color, 2)));
        obj_nbp(i).data.MarkerEdgeColor = input_color(:, min(i, size(input_color, 2)));
        obj_nbp(i).data.MarkerSize = pointsz;
    end

    for j = 1:3
        hAnnotation = eval(["get(obj_nbp(i)."+string(Fnames{j, 1}) + ", 'Annotation'); "]);
        hLegendEntry = get(hAnnotation, 'LegendInformation');
        set(hLegendEntry, 'IconDisplayStyle', 'off')
    end

end

hold on;
end

function input_color = color_default();
teal    = [0,150,136]/255;
orange  = [255,87,34]/255;
blue    = [0 0.447058826684952 0.74117648601532];
input_color = [teal;orange;blue]';
end