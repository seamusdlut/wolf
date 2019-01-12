CREATE TABLE `daily_basic`(
	`id` char(20) NOT NULL COMMENT '主键',
	`ts_code` char(10) NOT NULL COMMENT 'TS代码,如：000001.SZ',
	`trade_date` date NOT NULL COMMENT '交易日期: YYYYMMDD',
	`close` decimal(8,4) NOT NULL COMMENT '收盘价',
	`turnover_rate` decimal(8,4) NOT NULL COMMENT '换手率',
	`turnover_rate_f` decimal(8,4) default NULL COMMENT '换手率（自由流通股)',
	`volume_ratio` decimal(8,4) default NULL COMMENT '量比',
	`pe` decimal(10,4) default NULL COMMENT '市盈率（总市值/净利润）',
	`pe_ttm` decimal(10,4) default NULL COMMENT '市盈率（TTM）',
	`pb` decimal(10,4) default NULL COMMENT '市净率(总市值/净资产)',
	`ps` decimal(10,4) default NULL COMMENT '市销率',
	`ps_ttm` decimal(10,4) default NULL COMMENT '市销率(TTM)',
	`total_share` decimal(22,4) default NULL COMMENT '总股本(万)',
	`float_share` decimal(22,4) default NULL COMMENT '流通股本(万)',
	`free_share` decimal(22,4) default NULL COMMENT '自由流通股本(万)',
	`total_mv` decimal(18,4) default NULL COMMENT '总市值(万)',
	`circ_mv` decimal(18,4) default NULL COMMENT '流通市值(万)',
	PRIMARY KEY(`id`),
	UNIQUE KEY `uk_key` (`ts_code`,`trade_date`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '每日指标';

CREATE TABLE `stock_basic`(
	`id` char(20) NOT NULL COMMENT '主键',
	`ts_code` char(10) NOT NULL COMMENT 'TS代码，如：000001.SZ',
	`symbol` char(6) NOT NULL COMMENT '股票代码，如：000001',
	`name` char(10) NOT NULL COMMENT '股票名称',
	`area` char(10) DEFAULT NULL COMMENT '所在地域',
	`industry` varchar(20) default NULL COMMENT '所在行业',
	`fullname` varchar(50) default NULL COMMENT '股票全称',
	`enname` varchar(50) default NULL COMMENT '英文全称',
	`market` char(8) default NULL COMMENT '市场类型 （主板/中小板/创业板）',
	`exchange` char(4) default NULL COMMENT '交易所代码',
	`curr_type` varchar(10) default NULL COMMENT '交易货币',
	`list_status` char(1) default NULL COMMENT '上市状态： L上市 D退市 P暂停上市',
	`list_date` date default NULL COMMENT '上市日期',
	`delist_date` date default NULL COMMENT '退市日期',
	`is_hs` char(1) default NULL COMMENT '是否沪深港通标的，N否 H沪股通 S深股通',
	PRIMARY KEY(`id`),
	UNIQUE KEY `uk_key` (`ts_code`)
)ENGINE=InnoDB default CHARSET=utf8 COMMENT '股票列表';

CREATE TABLE `trade_cal`(
	`id` char(20) NOT NULL COMMENT '主键',
	`exchange` char(4) default NULL COMMENT '交易所代码：交易所 SSE上交所 SZSE深交所',
	`cal_date` date default NULL COMMENT '日历日期',
	`is_open` tinyint(1) default NULL COMMENT  '是否交易 0休市 1交易',
	`pretrade_date` date default NULL COMMENT '上一个交易日',
	PRIMARY KEY(`id`)
)ENGINE=InnoDB default CHARSET=utf8 COMMENT '股票列表';

CREATE TABLE `index_basic`(
	`id` char(20) NOT NULL COMMENT '主键',
	`ts_code` char(10) NOT NULL COMMENT 'TS代码，如：000001.SZ',
	`name` char(10) NOT NULL COMMENT '指数名称',
	`fullname` varchar(50) default NULL COMMENT '全称',
	`market` char(8) default NULL COMMENT '市场类型',
	`publisher` varchar(50) default NULL COMMENT '发布方',
	`index_type` varchar(10) default NULL COMMENT '指数风格',
	`category` varchar(20) default NULL COMMENT '指数类别',
	`base_date` date default NULL COMMENT '基期',
	`base_point` decimal(10,4) default NULL COMMENT '基点',
	`list_date` date default NULL COMMENT '发布日期',
	`weight_rule` varchar(20) default NULL COMMENT '加权方式',
	`desc` varchar(127) default NULL COMMENT '描述',
	`exp_date` date default NULL COMMENT '终止日期',
	PRIMARY KEY(`id`),
	UNIQUE KEY `uk_key` (`ts_code`)
)ENGINE=InnoDB default CHARSET=utf8 COMMENT '指数基本信息';

CREATE TABLE `index_daily`(
	`id` char(20) NOT NULL COMMENT `主键`,
	`ts_code` char(10) NOT NULL COMMENT 'TS代码,如：000001.SZ',
	`trade_date` date NOT NULL COMMENT '交易日期: YYYYMMDD',
	`close` decimal(10,4) NOT NULL COMMENT '收盘点位',
	`open` decimal(10,4) NOT NULL COMMENT '开盘点位',
	`high` decimal(10,4) NOT NULL COMMENT '最高点位',
	`low` decimal(10,4) NOT NULL COMMENT '最低点位',
	`pre_close` decimal(10,4) NOT NULL COMMENT '昨日收盘点',
	`change` decimal(10,4) NOT NULL COMMENT '涨跌点',
	`pct_chg` decimal(8,4) NOT NULL COMMENT '涨跌幅',
	`vol` decimal(18,4) NOT NULL COMMENT '成交量',
	`amount` decimal(18,4) NOT NULL COMMENT '成交额（千元）',
	PRIMARY KEY(`id`),
	UNIQUE KEY `uk_key` (`ts_code`,`trade_date`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '指数日线行情';

CREATE TABLE `index_dailybasic`(
	`id` char(20) NOT NULL COMMENT `主键`,
	`ts_code` char(10) NOT NULL COMMENT 'TS代码,如：000001.SZ',
	`trade_date` date NOT NULL COMMENT '交易日期: YYYYMMDD',
	`total_mv` decimal(22,4) NOT NULL COMMENT '当日总市值（元）',
	`float_mv` decimal(22,4) NOT NULL COMMENT '当日流通市值（元）',
	`total_share` decimal(22,4) NOT NULL COMMENT '当日总股本（股）',
	`float_share` decimal(22,4) NOT NULL COMMENT '当日流通股本（股）',
	`free_share` decimal(22,4) NOT NULL COMMENT '当日自由流通股本（股）',
	`turnover_rate` decimal(8,4) NOT NULL COMMENT '换手率',
	`turnover_rate_f` decimal(8,4) default NULL COMMENT '换手率（自由流通股)',
	`pe` decimal(10,4) default NULL COMMENT '市盈率（总市值/净利润）',
	`pe_ttm` decimal(10,4) default NULL COMMENT '市盈率（TTM）',
	`pb` decimal(10,4) default NULL COMMENT '市净率(总市值/净资产)',
	PRIMARY KEY(`id`),
	UNIQUE KEY `uk_key` (`ts_code`,`trade_date`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT '大盘指数每日指标';

