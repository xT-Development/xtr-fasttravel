lib.locale()
Config = {}

-- Debug Configs --
Config.Debug = false
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.WaitLength = 5 -- Time to wait between travelling (Set in Seconds)

-- Fast Travel Locations --
Config.Locations = {
    ['Valentine'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(-177.83, 647.31, 113.58, 60.79) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(-161.73, 636.23, 114.03, 231.32)
    },
    ['Strawberry'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(-1753.9, -385.17, 156.49, 235.7) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(-1749.23, -385.62, 156.36, 194.18)
    },
    ['Tumbleweed'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(-5522.7, -2903.0, -2.61, 37.03) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(-5518.69, -2901.29, -2.48, 25.19)
    },
    ['Armadillo'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(-3659.07, -2671.2, -13.76, 235.67) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(-3656.48, -2659.27, -13.71, 234.22)
    },
    ['Blackwater'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(-877.26, -1341.69, 43.29, 185.69) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(-872.82, -1337.64, 43.97, 83.11)
    },
    ['Rhodes'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(1229.92, -1279.36, 76.02, 331.34) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(1235.74, -1287.23, 76.92, 319.07)
    },
    ['Saint Denis'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(2751.7, -1396.07, 46.2, 303.41) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(2742.43, -1394.88, 46.18, 191.42)
    },
    ['Van Horn'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(2992.48, 572.28, 44.37, 255.08) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(2996.29, 567.01, 44.47, 122.03)
    },
    ['Annesburg'] = {
        Ped = { model = 'S_M_M_TrainStationWorker_01', coords = vector4(2934.28, 1301.09, 44.48, 64.24) },
        Blip = { enable = true, name = 'Fast Travel', sprite = 784218150, size = 0.5 },
        price = 0.05,
        spawnCoords = vector4(2936.84, 1308.46, 44.48, 78.77)
    },
}