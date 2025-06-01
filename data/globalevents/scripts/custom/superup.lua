function onThink(interval)
    local ricardoViado = SUPERUP:freeCave()

    if type(ricardoViado) ~= "table" then
        print("Erro: SUPERUP:freeCave() não retornou uma tabela.")
        return true
    end

    for _, b in pairs(ricardoViado) do
        if type(b) ~= "table" then
            print("Erro: Um elemento em ricardoViado não é uma tabela.")
        elseif type(b[1]) ~= "number" then
            print("Erro: O primeiro elemento de um item em ricardoViado não é um número.")
        elseif type(b[2]) ~= "number" then
            print("Erro: O segundo elemento de um item em ricardoViado não é um número.")
        else
            if os.time() >= b[2] then
                local query = string.format("UPDATE exclusive_hunts SET `guid_player` = %d, `time` = %d, `to_time` = %d WHERE `hunt_id` = %d", 0, 0, 0, b[1])
                local result = db.query(query)
                if not result then
                    print("Erro: Falha ao executar a consulta ao banco de dados.")
                end
            end
        end
    end

    return true
end