USE TelecomDWH;

CREATE TABLE dbo.fact_transactions (
    transaction_id  INT          NOT NULL PRIMARY KEY,
    IMSI            VARCHAR(9)   NOT NULL,
    subscriber_id   INT          NOT NULL,
    TAC             VARCHAR(8)   NOT NULL,
    SNR             VARCHAR(6)   NOT NULL,
    IMEI            VARCHAR(14)  NULL,
    CELL            INT          NOT NULL,
    LAC             INT          NOT NULL,
    EVENT_TYPE      VARCHAR(1)   NULL,
    EVENT_TS        DATETIME     NOT NULL
);

CREATE TABLE dbo.rejected_transactions (
    reject_id       INT          IDENTITY(1,1) PRIMARY KEY,
    ID              INT          NULL,
    IMSI            VARCHAR(9)   NULL,
    IMEI            VARCHAR(14)  NULL,
    CELL            INT          NULL,
    LAC             INT          NULL,
    EVENT_TYPE      VARCHAR(1)   NULL,
    EVENT_TS        VARCHAR(50)  NULL,
    reject_reason   VARCHAR(255) NOT NULL,
    file_name       VARCHAR(255) NOT NULL,
    rejected_at     DATETIME     DEFAULT GETDATE()
);


CREATE TABLE dbo.IMSI_reference (
    IMSI          VARCHAR(9) NOT NULL PRIMARY KEY,
    subscriber_id INT        NOT NULL
);


INSERT INTO dbo.IMSI_reference VALUES
('310120265', 1001),
('310120266', 1002),
('310120267', 1003);
