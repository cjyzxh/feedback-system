import { Controller, Get, Post, Put, Delete, Body, Param, Query, ParseIntPipe } from '@nestjs/common';
import { UserService } from './user.service';
import { CreateUserDto, UpdateUserDto, QueryUserDto } from './dto/user.dto';

@Controller('user')
export class UserController {
  constructor(private readonly userService: UserService) {}

  // 获取用户列表（分页）
  @Get()
  async getList(@Query() query: QueryUserDto) {
    const { list, total } = await this.userService.findAll(query);
    return {
      code: 200,
      message: 'success',
      data: {
        list,
        total,
        page: query.page || 1,
        pageSize: query.pageSize || 10,
      },
    };
  }

  // 获取用户详情
  @Get(':id')
  async getById(@Param('id', ParseIntPipe) id: number) {
    const user = await this.userService.findById(id);
    return {
      code: 200,
      message: 'success',
      data: user,
    };
  }

  // 创建用户
  @Post()
  async create(@Body() createUserDto: CreateUserDto) {
    const user = await this.userService.create(createUserDto);
    return {
      code: 200,
      message: '创建成功',
      data: user,
    };
  }

  // 更新用户
  @Put(':id')
  async update(
    @Param('id', ParseIntPipe) id: number,
    @Body() updateUserDto: UpdateUserDto,
  ) {
    const user = await this.userService.update(id, updateUserDto);
    return {
      code: 200,
      message: '更新成功',
      data: user,
    };
  }

  // 删除用户
  @Delete(':id')
  async remove(@Param('id', ParseIntPipe) id: number) {
    await this.userService.remove(id);
    return {
      code: 200,
      message: '删除成功',
      data: null,
    };
  }

  // 批量删除
  @Post('batch-delete')
  async batchRemove(@Body() body: { ids: number[] }) {
    await this.userService.batchRemove(body.ids);
    return {
      code: 200,
      message: '批量删除成功',
      data: null,
    };
  }
}
