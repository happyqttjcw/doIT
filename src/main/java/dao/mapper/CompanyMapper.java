package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import logic.Company;

public interface CompanyMapper {
	
	@Insert("insert into company (comno,comid,comname,bussno,compass,managername,managerphone,manageremail)"
			+ " value (#{comno},#{comid},#{comname},bussno,#{compass},#{managername},#{managerphone},#{manageremail})")
	void insert(Company company);
	
	@Select("select ifnull(max(comno),0) from company")
	int maxComno();
}
