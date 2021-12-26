using BootstrapBlazorApp.POCO.VaccinationLocation;
using BootstrapBlazorApp.Proxy;
using Microsoft.AspNetCore.Mvc;

namespace User.FrontEnd.BFF.Controllers;

[Route("/api/[controller]/[action]")]
public class VaccinationSiteController : Controller
{
    private readonly IVaccinationLocationProxy _vacc;

    public VaccinationSiteController(IVaccinationLocationProxy VaccinationLocationProxy)
    {
        _vacc = VaccinationLocationProxy;
    }

    [HttpGet]
    public async Task<List<VaccinationLocationResponse>> GetVaccination()
    {
        return await _vacc.GetList(new VaccinationLocationRequest());
    }
}
