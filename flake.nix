{
  description = "A configurable base 16 colorscheme";

  inputs.utils.url = "github:NewDawn0/nixUtils";

  outputs = { self, utils }: {
    overlays.default = final: prev: {
      vimPlugins = prev.vimPlugins // {
        loader-nvim = self.packages.${prev.system}.default;
      };
    };
    packages = utils.lib.eachSystem { } (pkgs: {
      default = pkgs.vimUtils.buildVimPlugin {
        name = "b16-nvim";
        src = ./.;
        meta = {
          description = "A configurable base 16 colorscheme";
          homepage = "https://github.com/NewDawn0/b16.nvim";
          license = pkgs.lib.licenses.mit;
          maintainers = with pkgs.lib.maintainers; [ NewDawn0 ];
        };
      };
    });
  };
}
