SELECT
    usm.userId,
    usm.merchantId,
    usm.stores,
    m.name AS merchantName
FROM
    (
        SELECT
            ust.userId,
            ust.merchantId,
            JSON_ARRAYAGG(
                JSON_OBJECT(
                    'storeId', ust.storeId,
                    'storeName', ust.storeName,
                    'permissionCodeList', ust.permissionCodeList
                )
            ) AS stores
        FROM
            (
                SELECT
                    pa.userId,
                    pa.storeId,
                    pa.merchantId,
                    pa.permissionCodeList,
                    s.name AS storeName
                FROM
                    (
                        SELECT
                            p.userId,
                            p.storeId,
                            ANY_VALUE(p.merchantId) AS merchantId,
                            JSON_ARRAYAGG(p.permissionCode) AS permissionCodeList
                        FROM
                            permission p
                        GROUP BY
                            p.userId,
                            p.storeId
                    ) pa
                JOIN
                    store s ON pa.storeId = s.id
            ) ust
        GROUP BY
            ust.userId,
            ust.merchantId
    ) usm
JOIN
    merchant m ON usm.merchantId = m.id
LIMIT 10;
