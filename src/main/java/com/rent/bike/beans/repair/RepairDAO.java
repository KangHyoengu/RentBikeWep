package com.rent.bike.beans.repair;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface RepairDAO {
	public List<RepairDTO> repairList(@Param("start") int start, @Param("end") int end);
	public int countAll();
	public int applyRepair(RepairDTO dto);
}
