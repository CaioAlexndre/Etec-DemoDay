using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace MyApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly MyDbContext _context;

        public UsersController(MyDbContext context)
        {
            _context = context;
        }

        [HttpPost]
        public async Task<IActionResult> RegisterUser([FromBody] User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            // Verificar se o usuário já existe
            var existingUser = await _context.Users
                .AsNoTracking()
                .FirstOrDefaultAsync(u => u.Username == user.Username);

            if (existingUser != null)
            {
                return Conflict("Usuário já existe");
            }

            // Verificar se o usuário está banido
            var isBanned = await IsUserBanned(user.Username);
            if (isBanned)
            {
                return Forbid("Usuário banido");
            }

            // Verificar se o formato de login e senha estão corretos
            if (!IsValidLoginFormat(user.Username) || !IsValidPasswordFormat(user.Password))
            {
                return BadRequest("Formato de login ou senha inválido");
            }

            // Criar novo usuário
            _context.Users.Add(user);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(RegisterUser), new { id = user.Id });
        }

        private async Task<bool> IsUserBanned(string username)
        {
            // Implementar lógica para verificar se o usuário está banido
            // Exemplo: consultar uma lista de usuários banidos em um banco de dados
            return false; // Retorna true se o usuário está banido
        }

        private bool IsValidLoginFormat(string login)
        {
            // Implementar lógica para verificar se o formato de login é válido
            // Exemplo: verificar se o login contém apenas caracteres alfanuméricos e underscore
            return true; // Retorna true se o formato de login é válido
        }

        private bool IsValidPasswordFormat(string password)
        {
            // Implementar lógica para verificar se o formato de senha é válido
            // Exemplo: verificar se a senha contém pelo menos 8 caracteres e contém caracteres maiúsculos e minúsculos
            return true; // Retorna true se o formato de senha é válido
        }
    }
}

public class MyDbContext : DbContext
{
    public MyDbContext(DbContextOptions<MyDbContext> options) : base(options)
    {
    }

    public DbSet<User> Users { get; set; }
}

public class User
{
    public int Id { get; set; }
    public string Username { get; set; }
    public string Email { get; set; }
    public string Password { get; set; }
}
