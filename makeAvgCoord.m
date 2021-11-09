% CARICA ROBA
filename = "backup1410";

% RIADATTARE 'STO SCHIFO CHE NON SO COME FARLO E ADESSO NON HO VOGLIA
% coordinate = backup1309h1251(:,1:3);
% indici = backup1309h1251(:,4);
coordinate = [grezzi.VarName3 grezzi.VarName4 grezzi.VarName5];
indici = grezzi.VarName6;

%%
% MAGIA OSCURA
% per favore non toccare
I = find(indici == 1);
reset = [diff(I); length(indici)-I(end)+1];

% CALCOLI
% maxIndex = max(indici);
% maxIndex = length(reset);
% nPunti = length(coordinate)/maxIndex;
nPunti = length(reset);
avgCoord = zeros(nPunti,3);
nome = string(zeros(nPunti,1));

for k = 1:nPunti
%     primo = maxIndex*(k-1)+1;
%     ultimo = maxIndex*k;
%     avgCoord(k,:) = mean(coordinate(primo:ultimo,:));
    avgCoord(k,:) = mean(coordinate( I(k):(I(k)+reset(k)-1) , : ) );
    nome(k) = '';
end

resTab = table(nome,avgCoord);

%% % OUTPUT
outputFile = sprintf("%s_averaged.csv",filename);
% PRODUZIONE FILE .CSV
writetable(resTab,outputFile,'Delimiter',',')
% STAMPA A VIDEO IL FILE APPENA PRODOTTO
% type recover.csv 