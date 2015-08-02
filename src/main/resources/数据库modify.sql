-- xuwenming 2015-07-16 start --
ALTER TABLE `dive_certificate_authority`
	ADD COLUMN `account_id` VARCHAR(36) NULL COMMENT '用户ID' AFTER `id`;
	
ALTER TABLE `dive_certificate_authority`
	CHANGE COLUMN `auth_date` `auth_date` DATE NULL DEFAULT NULL AFTER `audit_date`;
	
ALTER TABLE `dive_collect`
	ADD COLUMN `account_id` VARCHAR(36) NULL COMMENT '用户id' AFTER `id`;

ALTER TABLE `dive_log`
	CHANGE COLUMN `user_id` `account_id` VARCHAR(36) NULL DEFAULT NULL AFTER `seeing`;
	
ALTER TABLE `dive_log`
	ADD COLUMN `dive_address` VARCHAR(256) NULL DEFAULT NULL COMMENT '潜水地点' AFTER `addtime`,
	ADD COLUMN `high_gas` INT(1)  NULL DEFAULT NULL AFTER `file_src`;
	
ALTER TABLE `dive_log`
	CHANGE COLUMN `in_time` `in_time` TIME NULL DEFAULT NULL AFTER `gas_start`,
	CHANGE COLUMN `out_time` `out_time` TIME NULL DEFAULT NULL AFTER `log_type`;
-- xuwenming 2015-07-16 end --