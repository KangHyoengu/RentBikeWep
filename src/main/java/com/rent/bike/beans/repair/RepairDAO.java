package com.rent.bike.beans.repair;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface RepairDAO {
	public int applyRepair(RepairDTO dto);
}
