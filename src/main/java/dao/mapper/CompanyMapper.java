package dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import logic.Company;

public interface CompanyMapper {
	@Insert("insert into company (comno,comid,comname,compass,bussno,managername,managerphone,manageremail)"
			+ " value (#{comno},#{comid},#{comname},#{compass},#{bussno},#{managername},#{managerphone},#{manageremail})")
	void insert(Company company);

	@Select("select ifnull(max(comno),0) from company")
	int maxComno();

	@Update("update company set comname=#{comname}, bussno=#{bussno}, "
			+ "managername=#{managername}, comtype=#{comtype},comsize=#{comsize},"
			+ "managername=#{managername},managerphone=#{managerphone},manageremail=#{manageremail},"
			+ "comcontent=#{comcontent},compic=#{compic},comhomepage=#{comhomepage},comwelfare=#{comwelfare},"
			+ "comname=#{comname},combrand=#{combrand},comboss=#{comboss},comaddr=#{comaddr},"
			+ "comphone=#{comphone},comstaffnum=#{comstaffnum},combirth=#{combirth},comsales=#{comsales} ")
	void comUpdate(Company com);
}
