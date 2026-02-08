return {
    UseTarget = false,

    Selling = {
        model = `s_m_m_cntrybar_01`,
        coords = vector4(-1330.3938, -1284.7708, 5.0225, 197.8999),
        price = {
            ['orange_juice'] = {
                name = 'Portakal Suyu',
                price = 10
            },
            ['watermelon_slice'] = {
                name = 'Karpuz Dilimi',
                price = 15
            },
            ['grape_juice'] = {
                name = 'Üzüm Suyu',
                price = 20
            }
        }
    },

    Blips = {
        ['orange_collection_zone'] = {
            coords = vector3(2404.42, 4703.43, 33.39),
            sprite = 271,
            color = 17,
            scale = 0.8,
            name = 'Portakal Toplama'
        },
        ['watermelon_collection_zone'] = {
            coords = vector3(-101.01, 1909.83, 196.96),
            sprite = 271,
            color = 25,
            scale = 0.8,
            name = 'Karpuz Toplama'
        },
        ['grape_collection_zone'] = {
            coords = vector3(1986.86, 4805.03, 42.73),
            sprite = 271,
            color = 6,
            scale = 0.8,
            name = 'Üzüm Toplama'
        },
        ['orange_processing_zone'] = {
            coords = vector3(-41.9233, 1883.7974, 195.5721),
            sprite = 271,
            color = 17,
            scale = 0.8,
            name = 'Portakal İşleme'
        },
        ['watermelon_processing_zone'] = {
            coords = vector3(1695.6053, 4785.0562, 42.0022),
            sprite = 271,
            color = 25,
            scale = 0.8,
            name = 'Karpuz İşleme'
        },
        ['grape_processing_zone'] = {
            coords = vector3(178.6194, 3032.9756, 43.9756),
            sprite = 271,
            color = 6,
            scale = 0.8,
            name = 'Üzüm İşleme'
        },
        ['selling_zone'] = {
            coords = vector3(-1330.3938, -1284.7708, 5.0225),
            sprite = 480,
            color = 17,
            scale = 0.8,
            name = 'Meyve Satış'
        },
    },

    Orange = {
        Collection = {
            [1] = {
                coords = vector3(2434.72, 4677.23, 33.37),
                radius = 5.0,
                itemName = 'orange'
            },
            [2] = {
                coords = vector3(2420.83, 4674.27, 33.8),
                radius = 5.0,
                itemName = 'orange'
            },
            [3] = {
                coords = vector3(2403.22, 4687.39, 33.69),
                radius = 5.0,
                itemName = 'orange'
            },
            [4] = {
                coords = vector3(2404.42, 4703.43, 33.39),
                radius = 5.0,
                itemName = 'orange'
            },
            [5] = {
                coords = vector3(2383.85, 4712.84, 33.66),
                radius = 5.0,
                itemName = 'orange'
            },
            [6] = {
                coords = vector3(2365.9, 4728.94, 34.13),
                radius = 5.0,
                itemName = 'orange'
            }
        },
        Processing = {
            coords = vector3(-41.9233, 1883.7974, 195.5721),
            radius = 10.0,
            requiredItem = 'orange',
            rewardItem = 'orange_juice',
            rewardAmount = 1
        },
    },

    Watermelon = {
        Collection = {
            [1] = {
                coords = vector3(-117.41, 1910.38, 197.14),
                radius = 5.0,
                itemName = 'watermelon'
            },
            [2] = {
                coords = vector3(-112.85, 1910.11, 197.02),
                radius = 5.0,
                itemName = 'watermelon'
            },
            [3] = {
                coords = vector3(-106.81, 1909.93, 197.05),
                radius = 5.0,
                itemName = 'watermelon'
            },
            [4] = {
                coords = vector3(-101.01, 1909.83, 196.96),
                radius = 5.0,
                itemName = 'watermelon'
            },
            [5] = {
                coords = vector3(-93.61, 1909.79, 196.98),
                radius = 5.0,
                itemName = 'watermelon'
            }
        },
        Processing = {
            coords = vector3(1695.6053, 4785.0562, 42.0022),
            radius = 10.0,
            requiredItem = 'watermelon',
            rewardItem = 'watermelon_slice',
            rewardAmount = 1
        },
    },

    Grape = {
        Collection = {
            [1] = {
                coords = vector3(1991.72, 4818.76, 43.38),
                radius = 5.0,
                itemName = 'grape',
            },
            [2] = {
                coords = vector3(1995.17, 4815.45, 42.97),
                radius = 5.0,
                itemName = 'grape'
            },
            [3] = {
                coords = vector3(1997.5, 4813.09, 42.67),
                radius = 5.0,
                itemName = 'grape'
            },
            [4] = {
                coords = vector3(1986.86, 4805.03, 42.73),
                radius = 5.0,
                itemName = 'grape'
            },
            [5] = {
                coords = vector3(1985.24, 4806.67, 42.85),
                radius = 5.0,
                itemName = 'grape'
            },
            [6] = {
                coords = vector3(1982.73, 4809.19, 43.0),
                radius = 5.0,
                itemName = 'grape'
            }
        },
        Processing = {
            coords = vector3(178.6194, 3032.9756, 43.9756),
            radius = 10.0,
            requiredItem = 'grape',
            rewardItem = 'grape_juice',
            rewardAmount = 1
        },
    },
}