<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>
					<ul class="nav nav-list">
						<li class="active">
							<a href="${pageContext.request.contextPath}/home">
								<i class="icon-dashboard"></i>
								<span > 搜索 </span>
							</a>
						</li>

						<li>
							<a href="typography.html">
								<i class="icon-text-width"></i>
								<span > 上下架 </span>
							</a>
						</li>

						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span > 设备管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="elements.html">
										<i class="icon-double-angle-right"></i>
										模拟方案
									</a>
								</li>

								<li>
									<a href="buttons.html">
										<i class="icon-double-angle-right"></i>
										上下架工单
									</a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-list"></i>
								<span> 台账管理 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="${pageContext.request.contextPath}/ledger/detail">
										<i class="icon-double-angle-right"></i>
									     台账明细
									</a>
								</li>

								<li>
									<a href="${pageContext.request.contextPath}/stock/tostock">
										<i class="icon-double-angle-right"></i>
										库存
									</a>
								</li>
								
								<li>
									<a href="${pageContext.request.contextPath}/account/toaccount">
										<i class="icon-double-angle-right"></i>
										对账
									</a>
								</li>
								
								<li>
									<a href="${pageContext.request.contextPath}/scrap/toscrap">
										<i class="icon-double-angle-right"></i>
										报废库
									</a>
								</li>
								
								<li>
									<a href="${pageContext.request.contextPath}/allocation/toallocation">
										<i class="icon-double-angle-right"></i>
										调拨
									</a>
								</li>
							</ul>
						</li>

						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-edit"></i>
								<span> 系统报表 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="form-elements.html">
										<i class="icon-double-angle-right"></i>
										历史事件
									</a>
								</li>

								<li>
									<a href="form-wizard.html">
										<i class="icon-double-angle-right"></i>
										系统日志
									</a>
								</li>

								<li>
									<a href="wysiwyg.html">
										<i class="icon-double-angle-right"></i>
										操作日志
									</a>
								</li>
							</ul>
						</li>

						<li>
							<a href="${pageContext.request.contextPath}/userController/manager">
								<i class="icon-list-alt"></i>
								<span >系统管理</span>
							</a>
							<ul class="submenu">
								<li>
									<a href="form-elements.html">
										<i class="icon-double-angle-right"></i>
										用户管理
									</a>
								</li>

								<li>
									<a href="form-wizard.html">
										<i class="icon-double-angle-right"></i>
										角色管理
									</a>
								</li>
							</ul>
						</li>

						<li>
							<a href="calendar.html">
								<i class="icon-calendar"></i>

								<span >
									系统组态
									<span class="badge badge-transparent tooltip-error" title="2&nbsp;Important&nbsp;Events">
										<i class="icon-warning-sign red bigger-130"></i>
									</span>
								</span>
							</a>
							<ul class="submenu">
								<li>
									<a href="form-elements.html">
										<i class="icon-double-angle-right"></i>
										模拟部署
									</a>
								</li>

								<li>
									<a href="form-wizard.html">
										<i class="icon-double-angle-right"></i>
										机房维护
									</a>
								</li>
							</ul>
						</li>
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>